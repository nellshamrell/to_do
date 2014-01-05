require 'spec_helper'

describe Project do
  context "when it has a name" do
    subject{ build(:project) }

    its(:name) { should == "Kitchen" }

    it { should be_valid }
  end

  context "when it does NOT have a name" do
    subject{ Project.new }

    its(:name) { should be_blank }

    it { should_not be_valid }
  end

  context "when it has a duplicate name" do
    let!(:existing_project) { create(:project) }

    subject{ build(:project) }

    it { should_not be_valid }
  end
end
