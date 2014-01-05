require "spec_helper"

describe ToDoItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/to_do_items").should route_to("to_do_items#index")
    end

    it "routes to #new" do
      get("/to_do_items/new").should route_to("to_do_items#new")
    end

    it "routes to #show" do
      get("/to_do_items/1").should route_to("to_do_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/to_do_items/1/edit").should route_to("to_do_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/to_do_items").should route_to("to_do_items#create")
    end

    it "routes to #update" do
      put("/to_do_items/1").should route_to("to_do_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/to_do_items/1").should route_to("to_do_items#destroy", :id => "1")
    end

  end
end
