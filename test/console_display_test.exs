defmodule ConsoleDisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ConsoleDisplay
  doctest ToDo

  test "display contains To Do list" do
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([])
    end

    assert String.contains?(result, "To Do List")
  end

  test "display contains Command Cheatsheet" do
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([])
    end

    assert String.contains?(result, "Commands Cheatsheet")
  end

  test "display To-Do list with task" do
    todo_task = "Go to yoga tonight"
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([todo_task])
    end

    assert String.contains?(result, "[1] #{todo_task}\n")
  end

  test "display receives input from prompt" do
    add_command = "a"
    result = capture_io([input: add_command, capture_prompt: false], fn ->
      input = prompt_for_command
      IO.write input
    end)
    assert result == "a"
  end
end
