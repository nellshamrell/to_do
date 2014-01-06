require 'spec_helper'

describe ToDoItemsController do
  let!(:project) { create(:project) }
  let!(:to_do_item) { create(:to_do_item) }

  describe "GET #new" do
    it "assigns a new To Do Item to @to_do_item" do
      get :new, project: project
      assigns(:to_do_item).should be_new_record
    end

    it "renders the :new template" do
      get :new, project: project
      response.should render_template :new
    end

    it "assigns the item to the passed in proejct" do
      get :new, project: project
      assigns(:to_do_item).project.should == project
    end
  end

  describe "POST #create" do
    context "with valid attributes" do

      it "saves the new to do item in the database" do
        expect {
          post :create, {:to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)}
        }.to change(ToDoItem, :count).by(1)
      end

      it "redirects to the project" do
        post :create, {:to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)}
        response.should redirect_to project_url(Project.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new to do item in the database" do
        expect {
          post :create, {:to_do_item => {description: nil}}
        }.to_not change(ToDoItem, :count)
      end

      it "re-renders the :new template" do
        post :create, {:to_do_item => {description: nil}}
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested to do item" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)
        assigns(:to_do_item).should == to_do_item
      end

      context "when the task is undone" do
        it "marks the task as done" do
          to_do_item.done.should be_false
          put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)
          to_do_item.reload
          to_do_item.done.should be_true
        end
      end

      context "when the task is done" do
        before(:each) do
          to_do_item.done = true
          to_do_item.save!
          to_do_item.reload
          to_do_item.done.should be_true
        end

        it "marks the task as undone" do
          put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)
          to_do_item.reload
          to_do_item.done.should be_false
        end
      end

      it "redirects to the project" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: "something else")
        response.should redirect_to project_url(to_do_item.project)
      end

      context "when an error is returned" do
        before(:each) do
          ToDoItem.stub(:find).and_return(to_do_item)
          to_do_item.stub(:save!).and_return(false)
        end

        it "shows an error" do
          put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: "something else")
          flash[:notice].should include("An error occurred.  Please try again.")
        end
      end
    end
  end

  describe "DELETE destroy" do
    it "deletes the to do item" do
      expect{
        delete :destroy, id: to_do_item
      }.to change(ToDoItem,:count).by(-1)
    end

    it "redirects to the project show page" do
      delete :destroy, id: to_do_item
      response.should redirect_to project_url(Project.last)
    end
  end
end
