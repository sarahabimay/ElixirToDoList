defmodule ConsoleDisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  test "display contains the 'To Do List' heading" do
    result = capture_io fn ->
      ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([])
    end
    assert String.contains?(result, "To Do List")
  end

  test "display contains 'Commands Cheatsheet' heading" do
    result = capture_io fn ->
      assert ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([])
    end
    assert String.contains?(result, "Commands Cheatsheet")
  end

  test "display contains a task in the 'To-Do list'" do
    todo_tasks = ["Go to yoga tonight"]
    result = capture_io fn ->
      ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet(todo_tasks)
    end
    assert String.contains?(result, "[1] #{todo_tasks}\n")
  end

  test "input received from prompt" do
    user_input = "a"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert ToDo.ConsoleDisplay.prompt_for_command == user_input
    end)
  end
end
