# test/test_projects.rb
require 'httparty'
require 'samba_api/projects'

class TestProjects < Minitest::Test
  def setup
    @projects = SambaApi::Projects.new(access_token: ENV['SAMBA_TOKEN'])
    @invalid_projects = SambaApi::Projects.new(access_token: 'WRONG_TOKEN')
  end

  def test_get_all_projects
    
  end
end

