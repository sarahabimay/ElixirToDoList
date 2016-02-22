defmodule ToDo.ToDo do
  import ToDo.ToDoListApp

  def run do
    tasks = []
    todo_list_run(tasks)
  end
end
