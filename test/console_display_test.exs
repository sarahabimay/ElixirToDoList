defmodule ConsoleDisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ConsoleDisplay
  doctest ToDo

  setup do
    menu =
      "To Do List:\n\n" <>
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Items\n" <>
      "[bB] List All Items\n" <>
      "[cC<item_number>] Edit Item\n" <>
      "[dD<item_number>] Delete Item\n" <>
      "[eE] Exit\n\n"

      {:ok, menu_options: menu}
  end

  test "display empty To-Do list and Command cheatsheet", context do
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([])
    end

    assert result == context[:menu_options]
  end

  test "display To-Do list with item" do
    todo_item = "Go to yoga tonight"
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([todo_item])
    end

    assert String.contains?(result, "[1] #{todo_item}\n")
  end
end
