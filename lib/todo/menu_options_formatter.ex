defmodule ToDo.MenuOptionsFormatter do
  def menu_options_for_display do
    menu_options_content
    |> prepare_menu_options
    |> format_for_display
    |> append_newline
  end

  def menu_options_content do
    [ %{commands: "aA", task_number: false, description: "Add New To-Do Tasks"},
      %{commands: "bB", task_number: false, description: "List All Tasks"},
      %{commands: "cC", task_number: true, description: "Edit Task"},
      %{commands: "dD", task_number: true, description: "Delete Task"},
      %{commands: "eE", task_number: false, description: "Exit"}
    ]
  end

  def prepare_menu_options(options) do
    ["Commands Cheatsheet:"] ++
    Enum.map(options, fn(option) ->
      case option do
        %{commands: commands, task_number: true, description: d} -> "[#{commands}<space>task_number] #{d}"
        %{commands: commands, task_number: _, description: d} -> "[#{commands}] #{d}"
        _ -> ""
      end
    end)
  end

  defp format_for_display(options) do
    Enum.map_join(options, "\n", &("#{&1}"))
  end

  defp append_newline(command_display) do
    command_display <> "\n"
  end
end
