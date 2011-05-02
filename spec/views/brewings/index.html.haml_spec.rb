require 'spec_helper'

describe "brewings/index.html.haml" do
  before(:each) do
    assign(:brewings, [
      stub_model(Brewing,
        :name => "Name",
        :notes => "MyText",
        :brew_type_id => 1,
        :kit_name => "Kit Name"
      ),
      stub_model(Brewing,
        :name => "Name",
        :notes => "MyText",
        :brew_type_id => 1,
        :kit_name => "Kit Name"
      )
    ])
  end

  it "renders a list of brewings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Kit Name".to_s, :count => 2
  end
end
