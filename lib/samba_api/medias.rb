require 'samba_api'
require 'open3'

# lib/samba/medias.rb
module SambaApi 
  # medias class
  module Medias

    def all_medias(project_id)
      endpoint_url = base_url + 'medias' + access_token + '&pid=' + project_id.to_s
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def get_media(media_id, project_id)
      endpoint_url = media_base_url + media_id.to_s + access_token + '&pid=' + project_id.to_s
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def upload_media(media_path, project_id)
      upload_url = prepare_upload(project_id)
      
      stdin, stdout, stderr, wait_thr = *Open3.popen3(
        'curl', '--silent', '--show-error',
         '-X', 'POST', upload_url['uploadUrl'],
         '--header', 'Content-Type: multipart/form-data',
         '-F', "file=@#{media_path}"
      )
      wait_thr.join
      return false unless stderr.eof?
      http_response = JSON.parse(stdout.read)

      return http_response.merge(media_id: upload_url['id'], upload_response: upload_url)
    end

    def delete_media(media_id, project_id)
      endpoint_url = media_base_url + media_id.to_s + access_token + '&pid=' + project_id.to_s
      response = self.class.delete(endpoint_url, header_request)
      JSON.parse(response.body)
    end

    def active_media(media_id, project_id, body)
      #TODO better way to get project
      endpoint_url = media_base_url + media_id.to_s + access_token + '&pid=' + project_id.to_s
      response = self.class.put(endpoint_url, body: body, headers: header_request)
      response = JSON.parse(response.body)
    end

    def upload_thumbnail(samba_id)
      video = Video.find_by(samba_hash: samba_id)
      response = JSON.parse(prepare_thumbnail(samba_id))
      if video
        #IMPLEMENT NEW THUMB
      end
    end

    private

    def prepare_thumbnail(media_id)
      values = '{ "qualifier": "THUMBNAIL" }'
      endpoint_url = media_base_url + media_id.to_s + access_token + '&pid=' + project_id.to_s
      response  = self.class.post(endpoint_url, header_request)
      response = JSON.parse(response.body)
    end

    def prepare_upload(project_id)
      body = '{ "qualifier": "VIDEO" }'
      #TODO better way to get project
      endpoint_url = media_base_url + access_token +  '&pid=' + project_id.to_s
      response = self.class.post(endpoint_url, body: body, headers: header_request)
      response = JSON.parse(response.body)
    end
  end
end
