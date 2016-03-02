defmodule ToDo.AddTasks do
  def add_task(task, all_tasks) do
    List.flatten([all_tasks] ++ [task])
  end
end
