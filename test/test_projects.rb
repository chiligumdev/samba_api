# test/test_projects.rb
require 'httparty'
require 'samba_api/client'

module SambaApi
  class TestProjects < Minitest::Test
    def setup
      @projects = SambaApi::Projects.new(access_token: )
    end
  end
end
