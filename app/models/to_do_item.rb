class ToDoItem < ActiveRecord::Base
  belongs_to :project
end
