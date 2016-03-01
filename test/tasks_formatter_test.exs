defmodule TasksFormatterTest do
  use ExUnit.Case
  doctest ToDo

  setup do
    task1 = "Go to yoga tonight"
    task2 = "make to do list app"
    tasks = [ task1, task2 ]

    heading = "Your To Do List:"
    empty_for_display = "\n#{heading}\n\n"
    tasks_for_display =
      "\n#{heading}\n" <>
     "[1] #{task1}\n" <>
     "[2] #{task2}\n"

    {:ok, tasks: tasks, unpopulated_todo: empty_for_display, populated_todo: tasks_for_display}
  end

  test "empty task list produces empty display", context do
    assert ToDo.TasksFormatter.tasks_for_display([]) == context[:unpopulated_todo]
  end

  test "tasks with two tasks displayed correctly", context do
    assert ToDo.TasksFormatter.tasks_for_display(context[:tasks]) == context[:populated_todo]
  end
end
