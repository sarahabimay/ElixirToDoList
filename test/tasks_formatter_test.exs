defmodule TasksFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.TasksFormatter

  setup do
    task1 = "Go to yoga tonight"
    task2 = "make to do list app"

    tasks = [ task1, task2 ]

    empty_for_display = "\nTo Do List:\n\n"

    tasks_for_display =
      "\nTo Do List:\n" <>
     "[1] #{task1}\n" <>
     "[2] #{task2}\n"

    {:ok, tasks: tasks, unpopulated_todo: empty_for_display, populated_todo: tasks_for_display}
  end

  test "to do menu options displayed with no tasks", context do
    assert tasks_for_display([]) == context[:unpopulated_todo]
  end

  test "to do menu options displayed with two tasks", context do
    assert tasks_for_display(context[:tasks]) == context[:populated_todo]
  end
end
