defmodule ToDo.DeleteTask do
  def delete_task(task_number, tasks) do
    ToDo.CommandHelper.apply_command_to_task(task_number, tasks, delete)
  end

  def delete do
    fn(tasks, task_number) -> List.delete_at(tasks, task_number - 1) end
  end
end
