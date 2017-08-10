require 'spec_helper'

describe SambaApi::Projects, type: :controller do
  describe "GET #all_projects" do
    context "With no access token" do
      it "should return 401 HTTP status code" do
        get :all_projects
        expect(response.status).to eq(401)
      end
    end
  end
end