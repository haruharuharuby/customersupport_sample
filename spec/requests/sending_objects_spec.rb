require 'rails_helper'

RSpec.describe "SendingObjects", type: :request do
  describe "GET /sending_objects" do
    it "works! (now write some real specs)" do
      get sending_objects_path
      expect(response).to have_http_status(200)
    end
  end
end
