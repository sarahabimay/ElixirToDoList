defmodule ConsoleDisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  test "contains To Do List heading" do
    result = capture_io fn ->
      ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([])
    end
    assert String.contains?(result, "To Do List")
  end

  test "contains Commands Cheatsheet heading" do
    result = capture_io fn ->
      assert ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([])
    end
    assert String.contains?(result, "Commands Cheatsheet")
  end

  test "display To-Do list with task" do
    todo_tasks = ["Go to yoga tonight"]
    result = capture_io fn ->
      ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet(todo_tasks)
    end
    assert String.contains?(result, "[1] #{todo_tasks}\n")
  end

  test "display receives input from prompt" do
    add_command = "a"
    capture_io([input: add_command, capture_prompt: false], fn ->
      assert ToDo.ConsoleDisplay.prompt_for_command == add_command
    end)
  end
end
