require 'samba_api'
# lib/samba/projects.rb

module SambaApi
  class Projects
    include HTTParty

    def initialize(attributes = {})
      @options = { 'access_token' =>  attributes[:access_token], 'Content-Type' => 'application/json' }
    end

    def get_projects
      endpoint = SambaApi::BASE_URL
      namespace = SambaApi.demodulize_class(self.class)
      access_token = "?access_token=#{@options["access_token"]}"
      response = self.class.get(endpoint + namespace + access_token)
      JSON.parse(response.body)
    end
  end
end