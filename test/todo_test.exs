defmodule ToDoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  test "display items list and commands" do
    result = capture_io fn ->
      ToDo.ToDo.run
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
