defmodule ToDo.CommandHandler do
  import ToDo.AddTasksCommand
  import ToDo.DeleteTaskCommand

  @unrecognized_message  "Sorry, I don't recognize that command."

  def action_command({:exit}, _) do
    {:exit}
  end

  def action_command({:add, new_task}, previous_state) do
    add_task(new_task, previous_state)
  end

  def action_command({:delete, task_number}, previous_state) do
    delete_task(task_number, previous_state)
  end

  def action_command({_}, _) do
    @unrecognized_message
  end
end
