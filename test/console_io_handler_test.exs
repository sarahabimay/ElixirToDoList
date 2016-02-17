defmodule ConsoleIOHandlerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ConsoleIOHandler
  doctest ToDo

  test "display empty To-Do list and Command cheatsheet" do
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet([])
    end

    assert result ==
      "To Do List:\n\n" <>
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Items\n" <>
      "[bB] List All Items\n" <>
      "[cC<item_number>] Edit Item\n" <>
      "[dD<item_number>] Delete Item\n" <>
      "[eE] Exit\n\n"
  end

  test "display To-Do list with items and Command cheatsheet" do
    result = capture_io fn ->
      display_to_do_list_and_cheatsheet(["Go to yoga tonight", "make to do list app"])
    end

    assert result ==
      "To Do List:\n" <>
      "[1] Go to yoga tonight\n" <>
      "[2] make to do list app\n" <>
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Items\n" <>
      "[bB] List All Items\n" <>
      "[cC<item_number>] Edit Item\n" <>
      "[dD<item_number>] Delete Item\n" <>
      "[eE] Exit\n\n"
  end
end
