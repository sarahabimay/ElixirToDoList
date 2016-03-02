defmodule ToDo.CommandHelper do
  require Logger

  def apply_command_to_task(task_number, tasks, command) do
    number_of_tasks =  tuple_size(List.to_tuple(tasks))
    case Integer.parse(task_number) do
      {number, ""} when number in 1..number_of_tasks -> command.(tasks, number)
      {_, _} -> tasks
      :error -> tasks
    end
  end
end
