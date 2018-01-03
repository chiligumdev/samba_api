# test/test_medias.rb
require 'test_helper'

class TestMedias < Minitest::Test

  def setup_auth
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'somewrongdatatokeninthisvalueyuhhh')
  end

  def test_all_medias_with_valid_client_return_array
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    medias = @valid_client.all_medias(project["id"])
    assert_equal(medias.class, Array)
  end

  def test_all_medias_with_invalid_client
    setup_auth
    project = @valid_client.all_projects.sample
    refute_nil(project)
    response = @invalid_client.all_medias(project["id"])
    assert_equal(response["error"], 'invalid_token')
  end
end
