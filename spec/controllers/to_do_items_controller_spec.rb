require 'spec_helper'

describe ToDoItemsController do
  let!(:project) { create(:project) }
  let!(:to_do_item) { create(:to_do_item) }

  describe "GET #index" do
    it "populates an array of to_do_items" do
      get :index
      assigns(:to_do_items).should == ([to_do_item])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested to_do_item to @to_do_item" do
      get :show, id: to_do_item
      assigns(:to_do_item).should == to_do_item
    end

    it "renders the :show template" do
      get :show, id: to_do_item
      response.should render_template :show
    end
  end

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

      it "redirects to the new to do item" do
        post :create, {:to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)}
        response.should redirect_to ToDoItem.last
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

  describe "PUT update" do
    context "with valid attributes" do
      it "locates the requested to do item" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item)
        assigns(:to_do_item).should == to_do_item
      end

      it "changes the to do item's attributes" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: "something else")
        to_do_item.reload
        to_do_item.description.should == "something else"
      end

      it "redirects to the updated to do item" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: "something else")
        response.should redirect_to to_do_item
      end
    end

    context "with invalid attributes" do
      it "locates the requested to do item" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: nil)
        assigns(:to_do_item).should == to_do_item
      end

      it "does not change the to do item's attributes" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: nil)
        to_do_item.reload
        to_do_item.description.should_not be_nil
      end

      it "re-renders the edit template" do
        put :update, id: to_do_item, :to_do_item => FactoryGirlHelper.build_attributes(:to_do_item, description: nil)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "deletes the to do item" do
      expect{
        delete :destroy, id: to_do_item
      }.to change(ToDoItem,:count).by(-1)
    end

    it "redirects to to_do_items#index" do
      delete :destroy, id: to_do_item
      response.should redirect_to to_do_items_url
    end
  end
end
