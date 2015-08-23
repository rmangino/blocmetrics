require 'rails_helper'

RSpec.describe "RegisteredApplications", type: :request do
  describe "GET /registered_applications" do
    it "works! (now write some real specs)" do
      get registered_applications_path
      expect(response).to have_http_status(200)
    end
  end
end
