defmodule ToDo.ConsoleDisplay do
  import ToDo.MenuOptionsFormatter
  import ToDo.TasksFormatter

  @prompt "> "

  def display_to_do_list_and_cheatsheet(tasks) do
    display_put(tasks_for_display(tasks) <> menu_options_for_display)
  end

  def prompt_for_command do
    String.downcase(String.strip(display_get(@prompt)))
  end

  def display_get(message) do
    IO.gets message
  end

  def display_put(message) do
    IO.puts message
  end
end
