defmodule AddTasksCommandTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.AddTasksCommand

  test "add new task" do
    new_task = "Buy groceries"
    task1 = "Cook soup"
    task2 = "Eat soup"
    all_tasks = [task1, task2]
    assert add_task(all_tasks, new_task) == [new_task, task1, task2]
  end
end
