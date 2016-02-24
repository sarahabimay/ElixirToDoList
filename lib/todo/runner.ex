defmodule ToDo.Runner do
  def run do
    tasks = []
    ToDo.ToDoListApp.todo_list_run(tasks)
  end
end
