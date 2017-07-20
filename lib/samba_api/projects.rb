require 'samba_api'
# lib/samba/projects.rb

module SambaApi
  class Projects
    include HTTParty

    def initialize(attributes = {})
      @options = { 'access_token' =>  attributes[:access_token],
                   'Content-Type' => 'application/json' }
    end

    def all_projects
      prepare_endpoint
      response = self.class.get(prepare_endpoint)
      JSON.parse(response.body)
    end

    def project(project_id)
      # SOMETHING IN THE WAY, UHHHMMMM HUMMMMM YEAH
    end

    def create_project
      # SOMETHING IN THE WAY, UHHHMMMM HUMMMMM YEAH
    end

    def delete_project(project_id)
      # SOMETHING IN THE WAY, UHHHMMMM HUMMMMM YEAH
    end

    private

    def prepare_endpoint
      endpoint = SambaApi::BASE_URL
      namespace = SambaApi.demodulize_class(self.class)
      access_token = "?access_token=#{@options['access_token']}"
      return endpoint + namespace + access_token
    end
  end
end
