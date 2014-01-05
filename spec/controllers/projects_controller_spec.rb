require 'spec_helper'

describe ProjectsController do
  let!(:project) { create(:project) }
  describe "GET #index" do
    it "populates an array of projects" do
      get :index
      assigns(:projects).should == ([project])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested project to @project" do
      get :show, id: project
      assigns(:project).should == (project)
    end

    it "renders the :show template" do
      get :show, id: project
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Project to @project" do
      get :new
      assigns(:project).should be_new_record
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do

      it "saves the new project in the database" do
        expect {
          post :create, {:project => attributes_for(:project)}
        }.to change(Project, :count).by(1)
      end

      it "redirects to new project" do
        post :create, {:project => attributes_for(:project)}
        response.should redirect_to Project.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new project in the database" do
        expect {
          post :create, {:project => {name: nil}}
        }.to_not change(Project,:count)

      end

      it "re-renders the :new template" do
        post :create, {:project => {name: nil}}
        response.should render_template :new
      end
    end
  end

end
