# test/test_medias.rb
require 'test_helper'
require 'httparty'

class TestMedias < Minitest::Test

  def setup_auth
    data = YAML.load_file('config/application.yml')
    @valid_client = SambaApi::Init.new('access_token' => data['SECRET_TOKEN'])
    @invalid_client = SambaApi::Init.new('access_token' => 'somewrongdatatokeninthisvalueyuhhh')
    @media_path = 'https://s3-sa-east-1.amazonaws.com/chivm/videos/bcf7cb52242717eae70fdf7dd2428b2d.mp4'
  end

  def setup_tmp_local_media
    @media_path = 'https://s3-sa-east-1.amazonaws.com/chivm/videos/bcf7cb52242717eae70fdf7dd2428b2d.mp4'
    file_name = @media_path.split('/').last
    File.open("/tmp/#{file_name}", "wb") do |f|
      f.write HTTParty.get(@media_path).body
    end
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

  def test_get_media_with_valid_client
    setup_auth
    project = @valid_client.project(8046)
    refute_nil(project)
    media = @valid_client.all_medias(project["id"]).sample
    refute_nil(media)
    assert_equal(media["title"], @media_path.split('/').last)
    response = @valid_client.get_media(media["media_id"], project["id"])
    assert_equal(response.first["id"], media["id"])
  end

  def test_upload_media_with_valid_client
    setup_auth
    video_id_from_url = @media_path.split('/').last
    project = @valid_client.all_projects.sample
    setup_tmp_local_media
    response = @valid_client.upload_media("/tmp/#{video_id_from_url}", project["id"])
    assert_equal(response["type"], "UPLOAD")
  end
end
