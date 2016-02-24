defmodule ToDo.TasksFormatter do
  @heading "Your To Do List:"

  def tasks_for_display(tasks) do
    numbered_tasks(tasks)
    |> todo_list_for_display
    |> append_to_do_heading
    |> append_newline
  end

  defp numbered_tasks(tasks) do
    Enum.with_index(List.flatten(tasks))
  end

  defp todo_list_for_display(tasks_with_index) do
    Enum.map_join(tasks_with_index, "\n", fn({task, number}) ->
      "[#{number+1}] #{task}"
    end)
  end

  defp append_to_do_heading(display_tasks) do
    "\n#{@heading}\n#{display_tasks}"
  end

  defp append_newline(command_display) do
    command_display <> "\n"
  end
end
