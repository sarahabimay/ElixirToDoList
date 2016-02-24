defmodule ToDo.ToDoListApp do
  import ToDo.CommandHandler
  import ToDo.ConsoleDisplay

  @goodbye_message "Thanks for playing! Tasks are NOT persisted!"
  @new_task_message "New Task: "
  @amend_message "Amend task > "
  @invalid_message "Invalid Option Entered"

  def todo_list_run({:exit}) do
    display_put(@goodbye_message)
  end

  def todo_list_run({:list_tasks, tasks}) do
    display_get("Enter any key for menu options")
    todo_list_run(tasks)
  end

  def todo_list_run(tasks) do
    display_to_do_list_and_cheatsheet(tasks)
    prompt_for_command
    |> option_to_command(tasks)
    |> process_command(tasks)
    |> todo_list_run
  end

  def process_command(:exit, _) do
    {:exit}
  end

  def process_command(:list_tasks, tasks) do
    action_command({:list_tasks}, tasks)
    |> display_put
    {:list_tasks, tasks}
  end

  def process_command({:edit, task_number}, tasks) do
   action_command({:edit, task_number, String.strip(display_get("#{@amend_message}"))}, tasks)
  end

  def process_command({:delete, task_number}, tasks) do
   action_command({:delete, task_number}, tasks)
  end

  def process_command(:add, tasks) do
    get_new_tasks(tasks, :add)
  end

  def get_new_tasks(tasks, :add) do
    process_new_task({:add, String.strip(display_get(@new_task_message))}, tasks)
  end

  def process_new_task({:add, ""}, tasks) do
    tasks
  end

  def process_new_task(new_task, tasks) do
    action_command(new_task, tasks)
    |> get_new_tasks(:add)
  end

  def option_to_command("a", _) do
   :add
  end

  def option_to_command("b", _) do
   :list_tasks
  end

  def option_to_command("c" <> rest, _) do
   {:edit, String.strip(rest)}
  end

  def option_to_command("d" <> rest, _) do
   {:delete, String.strip(rest)}
  end

  def option_to_command("e", _) do
   :exit
  end

  def option_to_command(_, tasks) do
    display_put("#{@invalid_message}")
    todo_list_run(tasks)
  end
end
