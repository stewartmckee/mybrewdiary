require 'spec_helper'

describe "readings/index.html.haml" do
  before(:each) do
    assign(:readings, [
      stub_model(Reading,
        :brewing_id => 1,
        :temperature => 1.5,
        :specific_gravity => 1
      ),
      stub_model(Reading,
        :brewing_id => 1,
        :temperature => 1.5,
        :specific_gravity => 1
      )
    ])
  end

  it "renders a list of readings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
