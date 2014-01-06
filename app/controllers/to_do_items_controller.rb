class ToDoItemsController < ApplicationController
  before_action :set_to_do_item, only: [:edit, :update, :destroy]

  def new
    @to_do_item = ToDoItem.new(project: Project.find(params[:project]))

    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
  end

  def create
    @to_do_item = ToDoItem.new(to_do_item_params)
    respond_to do |format|
      if @to_do_item.save
        format.html { redirect_to project_url(@to_do_item.project), notice: 'To do item was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    # Currently, tasks can only be updated to be done or undone
    @to_do_item.done? ? @to_do_item.done = false : @to_do_item.done = true

    respond_to do |format|
      if @to_do_item.save!
        format.html { redirect_to project_url(@to_do_item.project), notice: 'To do item was successfully updated.' }
      else
        format.html { redirect_to project_url(@to_do_item.project), notice: 'An error occurred.  Please try again.' }
      end
    end
  end

  def destroy
    project = @to_do_item.project

    @to_do_item.destroy
    respond_to do |format|
      format.html { redirect_to project_url(project) }
    end
  end

  private
    def set_to_do_item
      @to_do_item = ToDoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_do_item_params
      params.require(:to_do_item).permit(:project_id, :description, :done)
    end
end
