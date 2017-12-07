# test/test_categories.rb
require 'test_helper'

class TestInit < Minitest::Test

  def setup_auth
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'fdkjshfkjdshfkdljshfjdklsfhkdjf')
  end

  def test_media_base_url
    setup_auth
    media_endpoint_url = 'http://api.sambavideos.sambatech.com/v1/medias/'.freeze
    class_name = @valid_client.send :media_base_url
    assert_equal(class_name, media_endpoint_url)
  end
end