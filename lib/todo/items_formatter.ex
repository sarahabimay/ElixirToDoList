defmodule ToDo.ItemsFormatter do
  def items_for_display(items) do
    numbered_items(items)
    |> todo_list_for_display
    |> append_to_do_heading
    |> append_newline
  end

  defp numbered_items(items) do
    Enum.with_index(items)
  end

  defp todo_list_for_display(items_with_index) do
    Enum.map_join(items_with_index, "\n", fn({item, number}) ->
      "[#{number+1}] #{item}"
    end)
  end

  defp append_to_do_heading(display_items) do
    "To Do List:\n#{display_items}"
  end

  defp append_newline(command_display) do
    command_display <> "\n"
  end
end
