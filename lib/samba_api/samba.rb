require 'open3'

# samba_class
class Samba
  include HTTParty
  BASE_API_URL = 'https://api.sambavideos.sambatech.com/v1'.freeze

  def initialize(attributes)
    @options = { 'access_token' =>  attributes[:access_token], 'Content-Type' => 'application/json'  }
  end

  def get_projects
    endpoint_projects = Samba::BASE_API_URL+"/projects?access_token=#{@options["access_token"]}"
    response = self.class.get(endpoint_projects)
    response = JSON.parse(response.body)
  end

  def get_project(project_id)
    endpoint_project = Samba::BASE_API_URL+"/projects/#{project_id}?access_token=#{@options["access_token"]}"
    response = self.class.get(endpoint_project)
    response = JSON.parse(response.body)
  end

  def media_upload_data
    body = '{ "qualifier": "VIDEO" }'
    #TODO better way to get project
    project_id = get_projects.first["id"]
    url = Samba::BASE_API_URL+"/medias?access_token=#{@options["access_token"]}&pid=#{project_id}"
    response = self.class.post(url, headers: @options, body: body)
    response = JSON.parse(response.body)
  end

  def upload_media(video_path)
    upload_url = media_upload_data["uploadUrl"]
    stdin, stdout, stderr, wait_thr = *Open3.popen3(
      'curl', '--silent', '--show-error',
       '-X', 'POST', upload_url,
       '--header', 'Content-Type: multipart/form-data',
       '-F', "file=@#{video_path}"
    )
    wait_thr.join
    return false unless stderr.eof?
      return stdout.read
  end

  def active_media(media_id, body)
    project_id = get_projects.first["id"]
    url = Samba::BASE_API_URL+"/medias/#{media_id}?access_token=#{@options["access_token"]}&pid=#{project_id}"
    response = self.class.put(url, headers: @options, body: body)
    response = JSON.parse(response.body)
  end

end