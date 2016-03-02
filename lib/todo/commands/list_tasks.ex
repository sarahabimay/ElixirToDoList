defmodule ToDo.ListTasks do
  @heading "Your To Do List:"

  def list_tasks(tasks) do
    ToDo.TasksFormatter.tasks_for_display(tasks)
  end
end
