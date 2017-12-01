# test/test_categories.rb
require 'test_helper'

class TestCategories < Minitest::Test

  def setup
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'fdkjshfkjdshfkdljshfjdklsfhkdjf')
  end

  
end