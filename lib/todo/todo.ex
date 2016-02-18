defmodule ToDo.ToDo do
  import ToDo.ToDoListManager

  def run do
    items = []
    task_manager(items)
  end
end
