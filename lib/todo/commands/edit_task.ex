defmodule ToDo.EditTask do
  def edit_task(task_number, amended_text, tasks) do
    ToDo.CommandHelper.apply_command_to_task(task_number, tasks, replace(amended_text))
  end

  def replace(amended_text) do
    fn(tasks, task_number) -> List.replace_at(tasks, task_number - 1, amended_text) end
  end
end
