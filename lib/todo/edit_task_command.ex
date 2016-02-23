defmodule ToDo.EditTaskCommand do

  def edit_task(task_number, amended_text, tasks) do
    number_of_tasks =  tuple_size(List.to_tuple(tasks))
    case Integer.parse(task_number) do
      {number, ""} when number in 1..number_of_tasks -> List.replace_at(tasks, number - 1, amended_text)
      {number, _} -> tasks
      :error -> tasks
    end
  end
end
