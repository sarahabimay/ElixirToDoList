defmodule ToDo.ToDoListApp do
  import ToDo.CommandHandler
  import ToDo.ConsoleDisplay

  @goodbye_message "Thanks for playing! Tasks are NOT persisted!"
  @new_task_message "New Task: "

  def todo_list_run({:exit}) do
    display_put(@goodbye_message)
  end

  def todo_list_run(tasks) do
    display_to_do_list_and_cheatsheet(tasks)
    prompt_for_command
    |> option_to_command(tasks)
    |> process_command(tasks)
  end

  def process_command(:exit, _) do
    todo_list_run({:exit})
  end

  def process_command(:add, tasks) do
    get_new_tasks(tasks, :add)
    |>
    todo_list_run
  end

  def get_new_tasks(tasks, :add) do
    process_new_task({:add, String.strip(display_get(@new_task_message))}, tasks)
  end

  def process_new_task({:add, ""}, tasks) do
    tasks
  end

  def process_new_task(new_task, tasks) do
    action_command(new_task, tasks)
    |>
    get_new_tasks(:add)
  end

  def option_to_command("a", _) do
   :add
  end

  def option_to_command("b", _) do
   :list_all
  end

  def option_to_command("c", _) do
   :edit
  end

  def option_to_command("d", _) do
   :delete
  end

  def option_to_command("e", _) do
   :exit
  end

  def option_to_command(_, tasks) do
    display_put("Invalid Option Entered")
    todo_list_run(tasks)
  end
end
