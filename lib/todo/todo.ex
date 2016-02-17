defmodule ToDo.ToDo do
  import ToDo.CommandMenuFormatter
  import ToDo.ItemsFormatter

  def run do
    items = ["Go to yoga tonight",
             "make to do list app"]
    IO.puts items_for_display(items) <> "\n" <>
            menu_options_for_display <> "\n"
  end
end
