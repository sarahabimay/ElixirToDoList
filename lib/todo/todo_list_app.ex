defmodule ToDo.ToDoListApp do

  def run({:exit}) do
    ToDo.ConsoleDisplay.say_goodbye
  end

  def run({:list_tasks, tasks}) do
    ToDo.ConsoleDisplay.prompt_for_any_key
    run(tasks)
  end

  def run(tasks) do
    ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet(tasks)
    ToDo.ConsoleDisplay.prompt_for_command
    |> process_command(tasks)
    |> run
  end

  def process_command(:invalid, tasks) do
    tasks
  end

  def process_command(:exit, _) do
    {:exit}
  end

  def process_command(:list_tasks, tasks) do
    ToDo.CommandHandler.action_command({:list_tasks}, tasks)
    |> ToDo.ConsoleDisplay.display_tasks
    {:list_tasks, tasks}
  end

  def process_command({:edit, task_number}, tasks) do
    amended_text = ToDo.ConsoleDisplay.get_amended_text
    ToDo.CommandHandler.action_command({:edit, task_number, amended_text}, tasks)
  end

  def process_command({:delete, task_number}, tasks) do
   ToDo.CommandHandler.action_command({:delete, task_number}, tasks)
  end

  def process_command(:add, tasks) do
    get_new_tasks(tasks, :add)
  end

  def get_new_tasks(tasks, :add) do
    new_task = ToDo.ConsoleDisplay.get_new_task
    process_new_task({:add, new_task}, tasks)
  end

  def process_new_task({:add, ""}, tasks) do
    tasks
  end

  def process_new_task(new_task, tasks) do
    ToDo.CommandHandler.action_command(new_task, tasks)
    |> get_new_tasks(:add)
  end
end
