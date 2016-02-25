defmodule AddTasksCommandTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.AddTasksCommand

  test "add new task" do
    new_task = "Buy groceries"
    all_tasks = []
    new_tasks = add_task(all_tasks, new_task)
    assert List.flatten(new_tasks) == [new_task]
  end
end
