defmodule ToDo.CommandHandler do
  @unrecognized_message  "Sorry, I don't recognize that command."

  def action_command({:exit}, _) do
    {:exit}
  end

  def action_command({:add, new_task}, previous_state) do
    ToDo.AddTasksCommand.add_task(new_task, previous_state)
  end

  def action_command({:list_tasks}, previous_state) do
    ToDo.ListTasksCommand.list_tasks(previous_state)
  end

  def action_command({:edit, task_number, amended_text}, previous_state) do
    ToDo.EditTaskCommand.edit_task(task_number, amended_text, previous_state)
  end

  def action_command({:delete, task_number}, previous_state) do
    ToDo.DeleteTaskCommand.delete_task(task_number, previous_state)
  end


  def action_command({_}, _) do
    @unrecognized_message
  end
end
