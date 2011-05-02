require 'spec_helper'

describe "readings/new.html.haml" do
  before(:each) do
    assign(:reading, stub_model(Reading,
      :brewing_id => 1,
      :temperature => 1.5,
      :specific_gravity => 1
    ).as_new_record)
  end

  it "renders new reading form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => readings_path, :method => "post" do
      assert_select "input#reading_brewing_id", :name => "reading[brewing_id]"
      assert_select "input#reading_temperature", :name => "reading[temperature]"
      assert_select "input#reading_specific_gravity", :name => "reading[specific_gravity]"
    end
  end
end
