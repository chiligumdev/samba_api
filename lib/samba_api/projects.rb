require 'samba_api'
# lib/samba/projects.rb

module SambaApi
  # projects class
  class Projects
    include HTTParty

    def initialize(attributes = {})
      @options = { 'access_token' =>  attributes[:access_token],
                   'Content-Type' => 'application/json' }
    end

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

    def create_project
      # SOMETHING IN THE WAY, UHHHMMMM HUMMMMM YEAH
    end

    def delete_project(project_id)
      # SOMETHING IN THE WAY, UHHHMMMM HUMMMMM YEAH
    end

    private

    def namespace
      SambaApi.demodulize_class(self.class)
    end

    def base_url
      SambaApi::BASE_URL
    end

    def access_token
      "?access_token=#{@options['access_token']}"
    end
  end
end
