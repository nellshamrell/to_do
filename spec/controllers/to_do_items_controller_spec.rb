require 'spec_helper'

describe ToDoItemsController do
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
      get :new
      assigns(:to_do_item).should be_new_record
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let!(:project) { create(:project) }

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
      it "does not save the new to do item in the database"
      it "re-renders the :new template"
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      it "locates the requested to do item"
      it "changes the to do item's attributes"
      it "redirects to the updated to do item"
    end

    context "with invalid attributes" do
      it "locates the requested to do item"
      it "does not change the to do item's attributes"
      it "re-renders the edit template"
    end
  end

  describe "DELETE destroy" do
    it "deletes the to do item"
    it "redirects to to_do_items#index"
  end
end
