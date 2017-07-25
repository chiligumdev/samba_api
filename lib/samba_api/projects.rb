require 'samba_api'
require 'samba_api/client'
# lib/samba/projects.rb

module SambaApi
  # projects class
  class Projects < SambaApi::Client
    include HTTParty

    def all_projects
      endpoint_url = base_url + namespace + access_token
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def project(project_id)
      endpoint_url = base_url + namespace + '/' + project_id.to_s + access_token
      response = self.class.get(endpoint_url)
      JSON.parse(response.body)
    end

    def create_project(name, desc)
      values = { name: name.to_s, description: desc.to_s }.to_json
      endpoint_url = base_url + namespace + access_token
      response = self.class.post(endpoint_url, values, header_json)
      response.code
    end

    def delete_project(project_id)
      endpoint_url = base_url + namespace + '/' + project_id.to_s + access_token
      response = self.class.delete(endpoint_url, header_json)
      response.code
    end

    private

    def namespace
      SambaApi.demodulize_class(self.class)
    end

    def base_url
      SambaApi::BASE_URL
    end

    def access_token
      "?access_token=#{@access_token}"
    end

    def header_json
      'application/json'
    end
  end
end
