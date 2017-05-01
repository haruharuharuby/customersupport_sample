require "rails_helper"

RSpec.describe CspsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/csps").to route_to("csps#index")
    end

    it "routes to #new" do
      expect(:get => "/csps/new").to route_to("csps#new")
    end

    it "routes to #show" do
      expect(:get => "/csps/1").to route_to("csps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/csps/1/edit").to route_to("csps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/csps").to route_to("csps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/csps/1").to route_to("csps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/csps/1").to route_to("csps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/csps/1").to route_to("csps#destroy", :id => "1")
    end

  end
end
