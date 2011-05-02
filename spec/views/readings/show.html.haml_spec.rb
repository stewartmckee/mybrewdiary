require 'spec_helper'

describe "readings/show.html.haml" do
  before(:each) do
    @reading = assign(:reading, stub_model(Reading,
      :brewing_id => 1,
      :temperature => 1.5,
      :specific_gravity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
