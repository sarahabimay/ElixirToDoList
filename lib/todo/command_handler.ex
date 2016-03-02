defmodule ToDo.CommandHandler do
  @unrecognized_message  "Sorry, I don't recognize that command."

  def option_to_command("a") do
   :add
  end

  def option_to_command("b") do
   :list_tasks
  end

  def option_to_command("c" <> rest) do
   {:edit, String.strip(rest)}
  end

  def option_to_command("d" <> rest) do
   {:delete, String.strip(rest)}
  end

  def option_to_command("e") do
   :exit
  end

  def option_to_command(_) do
    ToDo.ConsoleDisplay.invalid_option
    :invalid
  end

  def action_command({:exit}, _) do
    {:exit}
  end

  def action_command({:add, new_task}, previous_state) do
    ToDo.AddTasks.add_task(new_task, previous_state)
  end

  def action_command({:list_tasks}, previous_state) do
    ToDo.ListTasks.list_tasks(previous_state)
  end

  def action_command({:edit, task_number, amended_text}, previous_state) do
    ToDo.EditTask.edit_task(task_number, amended_text, previous_state)
  end

  def action_command({:delete, task_number}, previous_state) do
    ToDo.DeleteTask.delete_task(task_number, previous_state)
  end

  def action_command({_}, _) do
    @unrecognized_message
  end

  def isolate_task_number_from_request(request, tasks) do
    number_of_tasks =  tuple_size(List.to_tuple(tasks))
    case Integer.parse(request) do
      {number, ""} when number in 1..number_of_tasks -> number - 1
      {_, _} -> tasks
      :error -> tasks
    end
  end
end
