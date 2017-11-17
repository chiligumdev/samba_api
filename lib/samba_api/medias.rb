require 'samba_api'
require 'open3'

# lib/samba/medias.rb
module SambaApi 
  # medias class
  module Medias

    def all_medias project_id
      endpoint_url = base_url + 'medias' + access_token + '&pid=' + project_id.to_s
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end
    
  end
end
