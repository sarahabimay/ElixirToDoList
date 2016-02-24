defmodule ToDo.DeleteTaskCommand do
  def delete_task(task_number, tasks) when is_integer(task_number) do
    delete_task(Integer.to_string(task_number), tasks)
  end

  def delete_task(task_number, tasks) do
    number_of_tasks =  tuple_size(List.to_tuple(tasks))
    case Integer.parse(task_number) do
      {number, ""} when number in 1..number_of_tasks -> List.delete_at(tasks, number - 1)
      {number, _} -> tasks
      :error -> tasks
    end
  end
end
