defmodule ToDo.AddTasksCommand do

  def add_task(task, all_tasks) do
    [all_tasks] ++ [task]
  end
end
