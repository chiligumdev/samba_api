# test/test_projects.rb
require 'simplecov'
SimpleCov.start
require 'yaml'
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'
require 'httparty'
require 'samba_api/init'
require 'samba_api/projects'

class TestProjects < Minitest::Test

  def setup_auth
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'fdkjshfkjdshfkdljshfjdklsfhkdjf')
  end

  #TODO Continue tests from here!
  def test_all_projects_valid_client
    setup_auth
    byebug
    @valid_client.all_projects
  end

  def test_all_projects_invalid_client
    setup_auth
    response = @invalid_client.all_projects
    assert_equal('invalid_token' , response['error'])
  end
  
end

