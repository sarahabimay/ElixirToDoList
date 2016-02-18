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

  test "display To-Do list with item" do
    todo_item = "Go to yoga tonight"
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([todo_item])
    end

    assert String.contains?(result, "[1] #{todo_item}\n")
  end
end
