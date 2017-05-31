
class Api
  include HTTParty
  BASE_API_URL = 'http://api.sambavideos.sambatech.com/v1'

  def initialize(attributes)
    @options = { 'access_token' =>  attributes[:access_token], 'Content-Type' => 'application/json'  }
  end

  def get_projects
    endpoint_projects = Api::BASE_API_URL + "/projects?access_token=#{@options["access_token"]}"
    response = HTTParty.get(endpoint_projects)
    response = JSON.parse(response.body)
  end

  def get_project_id(project_id)
    endpoint_project = Api::BASE_API_URL + "/projects?access_token=#{@options["access_token"]}"
  end



end