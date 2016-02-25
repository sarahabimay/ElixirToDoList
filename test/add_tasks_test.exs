defmodule AddTasksCommandTest do
  use ExUnit.Case
  doctest ToDo

  test "it can add new task" do
    new_task = "Buy groceries"
    task1 = "Cook soup"
    task2 = "Eat soup"
    all_tasks = [task1, task2]
    expected_result = [new_task, task1, task2]
    assert ToDo.AddTasksCommand.add_task(all_tasks, new_task) == expected_result
  end
end
