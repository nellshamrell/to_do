require 'spec_helper'

describe ToDoItem do
  context "when it has a description" do
    subject{ build(:to_do_item) }

    its(:description) { should_not be_blank }

    it { should be_valid }
  end

  context "when it does not have a description" do
    subject{ ToDoItem.new }

    its(:description) { should be_blank }

    it { should_not be_valid }
  end

  context "when it has a project" do
    subject{ build(:to_do_item) }

    its(:project) { should_not be_nil }

    it { should be_valid }
  end

  context "when it does not have a project" do
    subject{ ToDoItem.new(description: "something") }

    its(:project) { should be_nil }

    it { should_not be_valid }
  end
end
