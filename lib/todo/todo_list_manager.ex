defmodule ToDo.ToDoListManager do
  import ToDo.ConsoleDisplay
  import ToDo.CommandHandler

  def task_manager(tasks) do
    display_to_do_list_and_cheatsheet(tasks)
    prompt_for_command
    |> action_command
  end
end
