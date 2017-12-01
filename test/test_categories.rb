# test/test_categories.rb
require 'test_helper'

class TestCategories < Minitest::Test

  def setup_auth
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'fdkjshfkjdshfkdljshfjdklsfhkdjf')
  end

  def test_all_categories_with_valid_client
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    response = @valid_client.all_categories(project["id"])
    assert_equal(response.sample["project"], project["id"])
  end

  def test_category_with_valid_client
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    category = @valid_client.all_categories(project["id"]).sample
    refute_nil(category)
    response = @valid_client.category(category["id"], project["id"])
    refute_nil(response)
    assert_equal(response["name"], category["name"])
  end

  def test_create_category_with_valid_client
  end
end