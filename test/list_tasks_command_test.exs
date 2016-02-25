defmodule ListTasksTest do
  use ExUnit.Case
  doctest ToDo

  test "it list all tasks it receives" do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    task_list = [task1, task2, task3]
    assert ToDo.ListTasksCommand.list_tasks(task_list) ==
      "\nYour To Do List:\n" <>
      "[1] #{task1}\n" <>
      "[2] #{task2}\n" <>
      "[3] #{task3}\n"
  end
end
