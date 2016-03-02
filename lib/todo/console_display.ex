defmodule ToDo.ConsoleDisplay do
  @goodbye_message "Thanks for playing! Tasks are NOT persisted!"
  @new_task_message "New Task: "
  @amend_message "Amend task > "
  @invalid_message "Invalid Option Entered"
  @enter_any_key_message "Enter any key for menu options"
  @prompt "> "

  def display_to_do_list_and_cheatsheet(tasks) do
    ToDo.TasksFormatter.tasks_for_display(tasks) <> ToDo.MenuOptionsFormatter.menu_options_for_display
    |> display_put
  end

  def prompt_for_command do
    String.downcase(display_get(@prompt))
    |> ToDo.CommandHandler.option_to_command
  end

  def prompt_for_any_key do
    display_get(@enter_any_key_message)
  end

  def invalid_option do
    display_put("#{@invalid_message}")
  end

  def display_tasks(tasks_for_display) do
    display_put(tasks_for_display)
  end

  def get_new_task do
    display_get(@new_task_message)
  end

  def get_amended_text do
    display_get("#{@amend_message}")
  end

  def say_goodbye do
    display_put(@goodbye_message)
  end

  def display_get(message) do
    String.strip(IO.gets(message))
  end

  def display_put(message) do
    IO.puts(message)
  end
end
