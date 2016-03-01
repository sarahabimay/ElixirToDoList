defmodule ToDo.Runner do
  def main(argv) do
    tasks = []
    ToDo.ToDoListApp.options(tasks)
  end
end
