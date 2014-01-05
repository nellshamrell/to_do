require 'spec_helper'

describe "to_do_items/index" do
  before(:each) do
    assign(:to_do_items, [
      stub_model(ToDoItem,
        :project => nil,
        :description => "Description",
        :done => false
      ),
      stub_model(ToDoItem,
        :project => nil,
        :description => "Description",
        :done => false
      )
    ])
  end

  it "renders a list of to_do_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
