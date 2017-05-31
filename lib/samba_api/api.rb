
class Api
  include HTTParty
  BASE_API_URL = 'http://api.sambavideos.sambatech.com/v1'

  def initialize(attributes)
    @options = { 'access_token' =>  attributes[:access_token], 'Content-Type' => 'application/json'  }
  end

  def get_projects
    endpoint_projects = Api::BASE_API_URL+"/projects?access_token=#{@options["access_token"]}"
    response = self.class.get(endpoint_projects)
    response = JSON.parse(response.body)
  end

  def get_project(project_id)
    endpoint_project = Api::BASE_API_URL+"/projects/#{project_id}?access_token=#{@options["access_token"]}"
    response = self.class.get(endpoint_project)
    response = JSON.parse(response.body)
  end

  def upload_media_url
    body = '{ "qualifier": "VIDEO" }'
    project_id = get_projects.first["id"]
    url = Api::BASE_API_URL+"/medias?access_token=#{@options["access_token"]}&pid=#{project_id}"
    response = self.class.post(url, headers: @options, body: body)
    response = JSON.parse(response.body)
    response["uploadUrl"]
  end



end