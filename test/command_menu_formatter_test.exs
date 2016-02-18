defmodule CommandMenuFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.CommandMenuFormatter

  test "command menu options for display" do
    assert menu_options_for_display ==
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Items\n" <>
      "[bB] List All Items\n" <>
      "[cC<item_number>] Edit Item\n" <>
      "[dD<item_number>] Delete Item\n" <>
      "[eE] Exit\n"
  end
end
