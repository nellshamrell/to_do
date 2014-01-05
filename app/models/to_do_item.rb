class ToDoItem < ActiveRecord::Base
  belongs_to :project

  validates :description, :project, presence: true
end
