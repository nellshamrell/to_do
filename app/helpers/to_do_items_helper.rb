module ToDoItemsHelper
  def row_class(item)
    item.done? ? "done-item" : "non-done-item"
  end
end
