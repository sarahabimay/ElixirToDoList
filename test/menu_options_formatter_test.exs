defmodule MenuOptionsFormatterTest do
  use ExUnit.Case
  doctest ToDo

  test "to do menu options displayed with no items" do
    assert ToDo.MenuOptionsFormatter.menu_options == [
      "To Do List:",
      [],
      "[aA] Add New To-Do Items",
      "[bB] List All Items",
      "[cC<item_number>] Edit Item",
      "[dD<item_number>] Delete Item"
      ]
  end
end
