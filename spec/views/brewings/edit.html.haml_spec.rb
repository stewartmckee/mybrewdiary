require 'spec_helper'

describe "brewings/edit.html.haml" do
  before(:each) do
    @brewing = assign(:brewing, stub_model(Brewing,
      :name => "MyString",
      :notes => "MyText",
      :brew_type_id => 1,
      :kit_name => "MyString"
    ))
  end

  it "renders the edit brewing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brewings_path(@brewing), :method => "post" do
      assert_select "input#brewing_name", :name => "brewing[name]"
      assert_select "textarea#brewing_notes", :name => "brewing[notes]"
      assert_select "input#brewing_brew_type_id", :name => "brewing[brew_type_id]"
      assert_select "input#brewing_kit_name", :name => "brewing[kit_name]"
    end
  end
end
