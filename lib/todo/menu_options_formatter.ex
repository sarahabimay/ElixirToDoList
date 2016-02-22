defmodule ToDo.MenuOptionsFormatter do
  def menu_options_for_display do
    Enum.map_join(menu_options, "\n", &("#{&1}"))
    |> append_newline
  end

  defp menu_options do
      [
      "Commands Cheatsheet:",
      "[aA] Add New To-Do Items",
      "[bB] List All Items",
      "[cC<item_number>] Edit Item",
      "[dD<item_number>] Delete Item",
      "[eE] Exit"
      ]
  end

  defp append_newline(command_display) do
    command_display <> "\n"
  end
end
