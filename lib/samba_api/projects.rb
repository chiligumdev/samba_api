require 'samba_api'
# lib/samba/projects.rb

module SambaApi
  # projects class
  module Projects
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
      values = { "name": name.to_s, "description": desc.to_s }.to_json
      endpoint_url = base_url + namespace + access_token
      response = HTTParty.post(endpoint_url, body: values, headers: header_request)
      JSON.parse response, symbolize_names: true
    end

    def delete_project(project_id)
      endpoint_url = base_url + namespace + '/' + project_id.to_s + access_token
      response = self.class.delete(endpoint_url, header_request)
      response.code
    end

    private

    def namespace
      SambaApi.demodulize_class(self.class.ancestors[1])
    end

    def base_url
      SambaApi::BASE_URL
    end

    def access_token
      "?access_token=#{@access_token}"
    end

    def header_request
      {"Content-Type" => "application/json"}
    end
  end
end
