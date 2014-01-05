require 'spec_helper'

describe "to_do_items/show" do
  before(:each) do
    @to_do_item = assign(:to_do_item, stub_model(ToDoItem,
      :project => nil,
      :description => "Description",
      :done => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Description/)
    rendered.should match(/false/)
  end
end
