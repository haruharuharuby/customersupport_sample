require "rails_helper"

RSpec.describe NurseriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nurseries").to route_to("nurseries#index")
    end

    it "routes to #new" do
      expect(:get => "/nurseries/new").to route_to("nurseries#new")
    end

    it "routes to #show" do
      expect(:get => "/nurseries/1").to route_to("nurseries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nurseries/1/edit").to route_to("nurseries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nurseries").to route_to("nurseries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nurseries/1").to route_to("nurseries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nurseries/1").to route_to("nurseries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nurseries/1").to route_to("nurseries#destroy", :id => "1")
    end

  end
end
