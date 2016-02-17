defmodule ToDo.ToDo do
  import ToDo.ConsoleIOHandler

  def run do
    items = ["Go to yoga tonight",
             "make to do list app"]
    display_to_do_list_and_cheatsheet(items)
  end
end
