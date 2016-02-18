defmodule ToDo.ItemsFormatter do
  def items_for_display(items) do
    add_indexes_to_items_list(items)
    |> convert_items_list_for_display
    |> append_to_do_heading
    |> append_newline
  end

  defp add_indexes_to_items_list(items) do
    Enum.with_index(items)
  end

  defp convert_items_list_for_display(items_with_index) do
    Enum.map_join(items_with_index, "\n", fn(item_tuple) ->
      {item, number} = item_tuple
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
