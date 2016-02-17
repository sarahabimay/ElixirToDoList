defmodule ItemsFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.ItemsFormatter

  test "to do menu options displayed with no items" do
    assert items_for_display([ 'Go to yoga tonight', 'make to do list app']) ==
    "To Do List: \n" <>
    "[1] Go to yoga tonight\n" <>
    "[2] make to do list app"
  end
end
