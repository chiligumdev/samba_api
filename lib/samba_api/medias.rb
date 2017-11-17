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

    def upload_media
      prepare_upload
      byebug
    end

    private

    # Before to send media, its necessary to create a url to pass the file, this method do this
    def prepare_upload
      body = '{ "qualifier": "VIDEO" }'
      #TODO better way to get project
      project_id = all_projects.first['id']
      endpoint_url = media_base_url + access_token +  '&pid=' + project_id.to_s
      response = self.class.post(endpoint_url, body: body, headers: header_request)
      response = JSON.parse(response.body)
    end
  end
end
