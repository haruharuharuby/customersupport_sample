require 'rails_helper'

RSpec.describe "Csps", type: :request do
  describe "GET /csps" do
    it "works! (now write some real specs)" do
      get csps_path
      expect(response).to have_http_status(200)
    end
  end
end
