defmodule ToDo.MenuOptionsFormatter do
  def menu_options do
       ["To Do List:",
       [],
      "[aA] Add New To-Do Items",
      "[bB] List All Items",
      "[cC<item_number>] Edit Item",
      "[dD<item_number>] Delete Item"
      ]
  end
end
