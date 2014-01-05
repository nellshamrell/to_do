require 'spec_helper'

describe "to_do_items/new" do
  before(:each) do
    assign(:to_do_item, stub_model(ToDoItem,
      :project => nil,
      :description => "MyString",
      :done => false
    ).as_new_record)
  end

  it "renders new to_do_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", to_do_items_path, "post" do
      assert_select "input#to_do_item_project[name=?]", "to_do_item[project]"
      assert_select "input#to_do_item_description[name=?]", "to_do_item[description]"
      assert_select "input#to_do_item_done[name=?]", "to_do_item[done]"
    end
  end
end
