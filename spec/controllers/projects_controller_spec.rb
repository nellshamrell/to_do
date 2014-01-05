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

  describe "PUT update" do
    context "with valid attributes" do
      it "locates the requested project" do
        put :update, id: project.id, project: attributes_for(:project)
        assigns(:project).should == project
      end

      it "changes the project's attributes" do
        put :update, id: project.id, project: attributes_for(:project, name: "something_else")
        project.reload
        project.name.should == "something_else"
      end

      it "redirects to the updated project" do
        put :update, id: project.id, project: attributes_for(:project, name: "something_else")
        response.should redirect_to project
      end
    end

    context "with invalid attributes" do
      it "locates the requested project" do
        put :update, id: project.id, project: attributes_for(:project, name: nil )
        assigns(:project).should == project
      end

      it "does not change the project's attributes" do
        put :update, id: project.id, project: attributes_for(:project, name: nil )
        project.reload
        project.name.should_not be_nil
      end

      it "re-renders the edit template" do
        put :update, id: project.id, project: attributes_for(:project, name: nil )
        response.should render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "deletes the project" do
      expect{
        delete :destroy, id: project
      }.to change(Project,:count).by(-1)
    end

    it "redirects to projects#index" do
      delete :destroy, id: project
      response.should redirect_to projects_url
    end
  end

end
