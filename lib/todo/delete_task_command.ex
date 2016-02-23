defmodule ToDo.DeleteTaskCommand do
  def delete_task(task_number, tasks) when not is_integer(task_number) do
    tasks
  end

  def delete_task(task_number, tasks) do
    number_of_tasks =  tuple_size(List.to_tuple(tasks))
    case task_number do
      number when number in 1..number_of_tasks -> List.delete_at(tasks, number-1)
      _ -> tasks
    end
  end
end
