defmodule ToDo.CommandMenuFormatter do
  def menu_options_for_display do
    Enum.map_join(commands_title ++ menu_options, "\n", &("#{&1}"))
  end

  defp commands_title do
    ["Commands:"]
  end

  defp menu_options do
      [
      "[aA] Add New To-Do Items",
      "[bB] List All Items",
      "[cC<item_number>] Edit Item",
      "[dD<item_number>] Delete Item"
      ]
  end
end
