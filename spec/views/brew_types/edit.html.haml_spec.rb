require 'spec_helper'

describe "brew_types/edit.html.haml" do
  before(:each) do
    @brew_type = assign(:brew_type, stub_model(BrewType,
      :name => "MyString"
    ))
  end

  it "renders the edit brew_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brew_types_path(@brew_type), :method => "post" do
      assert_select "input#brew_type_name", :name => "brew_type[name]"
    end
  end
end
