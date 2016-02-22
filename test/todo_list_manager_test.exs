defmodule ToDoListManagerTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.ToDoListManager
  import ExUnit.CaptureIO

  test "display tasks & menu options and receive valid command" do
    tasks = []
    add_task_command = "A"
    result = capture_io([input: add_task_command], fn ->
     input = task_manager(tasks)
     IO.write(input)
    end)

    assert String.contains?(result, "New To-Do Task: > ")
  end

  test "display tasks & menu options and receive invalid command" do
    tasks = []
    add_task_command = "9"
    result = capture_io([input: add_task_command], fn ->
     input = task_manager(tasks)
     IO.write(input)
    end)

    assert String.contains?(result, "Sorry, I don't recognize that command")
  end
end
