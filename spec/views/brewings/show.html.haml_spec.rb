require 'spec_helper'

describe "brewings/show.html.haml" do
  before(:each) do
    @brewing = assign(:brewing, stub_model(Brewing,
      :name => "Name",
      :notes => "MyText",
      :brew_type_id => 1,
      :kit_name => "Kit Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Kit Name/)
  end
end
