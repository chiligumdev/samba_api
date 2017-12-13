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

  def test_create_category_with_invalid_key_option
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    response = @valid_client.create_category(project["id"], ham: Faker::Name.name )
    assert_equal(response[:exception][:message],"Field errors: name : rejected value [null]")
  end

  def test_create_category_with_valid_valid_key_option
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    response = @valid_client.create_category(project["id"], name: Faker::Name.name )
    assert_equal(response[:project], project["id"])
  end

  def test_delete_category_with_valid_client
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    category = @valid_client.create_category(project["id"], name: Faker::Name.name )
    refute_nil(category)
    response = @valid_client.delete_category(category[:id], category[:project])
    assert_equal(response["id"], category[:id])
  end
end