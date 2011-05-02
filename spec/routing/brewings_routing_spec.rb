require "spec_helper"

describe BrewingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/brewings" }.should route_to(:controller => "brewings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/brewings/new" }.should route_to(:controller => "brewings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/brewings/1" }.should route_to(:controller => "brewings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/brewings/1/edit" }.should route_to(:controller => "brewings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/brewings" }.should route_to(:controller => "brewings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/brewings/1" }.should route_to(:controller => "brewings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/brewings/1" }.should route_to(:controller => "brewings", :action => "destroy", :id => "1")
    end

  end
end
