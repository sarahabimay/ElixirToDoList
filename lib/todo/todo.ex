defmodule ToDo.ToDo do
  import ToDo.ConsoleDisplay

  def run do
    items = []
    display_to_do_list_and_cheatsheet(items)
  end
end
