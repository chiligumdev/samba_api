# test/test_projects.rb
require 'simplecov'
SimpleCov.start
require 'faker'
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
    response = @valid_client.all_projects
    refute_nil(response)
    diff(response.size, 0)
  end

  def test_all_projects_invalid_client
    setup_auth
    response = @invalid_client.all_projects
    assert_equal('invalid_token' , response['error'])
  end

  def test_project_with_valid_client
    setup_auth
    project = @valid_client.all_projects.first
    project_name = project['name']
    response = @valid_client.project(project["id"])
    refute_nil(response)
    assert_equal(response["name"], project_name)
  end

  def test_project_with_invalid_client
    setup_auth
    project = @invalid_client.all_projects.first
    assert_equal(project[1], "invalid_token")
  end

  def test_create_new_project_with_valid_client
    setup_auth
    name_project = Faker::Name.name 
    desc_project = Faker::Movie.quote
    response = @valid_client.create_project(name_project, desc_project)
    refute_nil(response)
    assert_equal(response[:name], name_project)
    assert_equal(response[:description], desc_project)
  end

  def test_create_new_project_with_invalid_client
    setup_auth
    name_project = Faker::Name.name 
    desc_project = Faker::Movie.quote
    response = @invalid_client.create_project(name_project, desc_project)
    refute_nil(response)
    assert_equal(response[:error], "invalid_token")
  end

  def test_delete_project_with_valid_client
    setup_auth
    project = @valid_client.all_projects.first
    response = @valid_client.delete_project(project["id"])
    assert_equal(response[:status_code], 200)
    refute_nil(response)
  end
end
