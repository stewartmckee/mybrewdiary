require 'spec_helper'

describe "brew_types/show.html.haml" do
  before(:each) do
    @brew_type = assign(:brew_type, stub_model(BrewType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
