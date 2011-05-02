require 'spec_helper'

describe "brew_types/index.html.haml" do
  before(:each) do
    assign(:brew_types, [
      stub_model(BrewType,
        :name => "Name"
      ),
      stub_model(BrewType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of brew_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
