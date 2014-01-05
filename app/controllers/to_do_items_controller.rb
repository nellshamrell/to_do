class ToDoItemsController < ApplicationController
  before_action :set_to_do_item, only: [:show, :edit, :update, :destroy]

  def index
    @to_do_items = ToDoItem.all
  end

  def show
  end

  def new
    @to_do_item = ToDoItem.new
  end

  def edit
  end

  def create
    @to_do_item = ToDoItem.new(to_do_item_params)
    respond_to do |format|
      if @to_do_item.save
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @to_do_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @to_do_item.update(to_do_item_params)
        format.html { redirect_to @to_do_item, notice: 'To do item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @to_do_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @to_do_item.destroy
    respond_to do |format|
      format.html { redirect_to to_do_items_url }
      format.json { head :no_content }
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
