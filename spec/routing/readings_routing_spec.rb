require "spec_helper"

describe ReadingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/readings" }.should route_to(:controller => "readings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/readings/new" }.should route_to(:controller => "readings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/readings/1" }.should route_to(:controller => "readings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/readings/1/edit" }.should route_to(:controller => "readings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/readings" }.should route_to(:controller => "readings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/readings/1" }.should route_to(:controller => "readings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/readings/1" }.should route_to(:controller => "readings", :action => "destroy", :id => "1")
    end

  end
end
