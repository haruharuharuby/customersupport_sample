require "rails_helper"

RSpec.describe SendingObjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sending_objects").to route_to("sending_objects#index")
    end

    it "routes to #new" do
      expect(:get => "/sending_objects/new").to route_to("sending_objects#new")
    end

    it "routes to #show" do
      expect(:get => "/sending_objects/1").to route_to("sending_objects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sending_objects/1/edit").to route_to("sending_objects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sending_objects").to route_to("sending_objects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sending_objects/1").to route_to("sending_objects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sending_objects/1").to route_to("sending_objects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sending_objects/1").to route_to("sending_objects#destroy", :id => "1")
    end

  end
end
