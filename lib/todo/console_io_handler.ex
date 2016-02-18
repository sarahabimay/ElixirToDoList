defmodule ToDo.ConsoleIOHandler do
  import ToDo.CommandMenuFormatter
  import ToDo.ItemsFormatter

  def display_to_do_list_and_cheatsheet(items) do
    IO.puts items_for_display(items) <>
            menu_options_for_display
  end
end
