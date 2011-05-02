require 'spec_helper'

describe "brew_types/new.html.haml" do
  before(:each) do
    assign(:brew_type, stub_model(BrewType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new brew_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brew_types_path, :method => "post" do
      assert_select "input#brew_type_name", :name => "brew_type[name]"
    end
  end
end
