defmodule ToDo.Runner do
  def main do
    tasks = []
    ToDo.ToDoListApp.options(tasks)
  end
end
