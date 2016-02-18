defmodule MenuOptionsFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.MenuOptionsFormatter

  setup do
    menu =
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Items\n" <>
      "[bB] List All Items\n" <>
      "[cC<item_number>] Edit Item\n" <>
      "[dD<item_number>] Delete Item\n" <>
      "[eE] Exit\n"

      {:ok, menu_options: menu}
  end

  test "command menu options for display", context do
    assert menu_options_for_display == context[:menu_options]
  end
end
