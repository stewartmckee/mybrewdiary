require "spec_helper"

describe BrewTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/brew_types" }.should route_to(:controller => "brew_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/brew_types/new" }.should route_to(:controller => "brew_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/brew_types/1" }.should route_to(:controller => "brew_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/brew_types/1/edit" }.should route_to(:controller => "brew_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/brew_types" }.should route_to(:controller => "brew_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/brew_types/1" }.should route_to(:controller => "brew_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/brew_types/1" }.should route_to(:controller => "brew_types", :action => "destroy", :id => "1")
    end

  end
end
