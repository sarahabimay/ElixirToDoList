defmodule ToDoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ToDo
  doctest ToDo

  test "display includes To Do list" do
    add_task_command = "A"
    result = capture_io([input: add_task_command], fn ->
      input = run
      IO.write(input)
    end)
    assert String.contains?(result, "To Do List:\n")
  end

  test "display includes Commands menu" do
    add_task_command = "A"
    result = capture_io([input: add_task_command], fn ->
      input = run
      IO.write(input)
    end)
    assert String.contains?(result, "Commands Cheatsheet:\n")
  end
end
