defmodule ToDo.MenuOptionsFormatter do
  def menu_options_for_display do
    menu_options_content
    |> prepare_menu_options
    |> format_for_display
    |> append_newline
  end

  def menu_options_content do
    [ %{downcase_command: "a", upcase_command: "A", task_number: false, description: "Add New To-Do Tasks"},
      %{downcase_command: "b", upcase_command: "B", task_number: false, description: "List All Tasks"},
      %{downcase_command: "c", upcase_command: "C", task_number: true, description: "Edit Task"},
      %{downcase_command: "d", upcase_command: "D", task_number: true, description: "Delete Task"},
      %{downcase_command: "e", upcase_command: "E", task_number: false, description: "Exit"}
    ]
  end

  def prepare_menu_options(options) do
    ["Commands Cheatsheet:"] ++
    Enum.map(options, fn(option) ->
      case option do
        %{downcase_command: lc, upcase_command: uc, task_number: false, description: d} -> "[#{lc}#{uc}] #{d}"
        %{downcase_command: lc, upcase_command: uc, task_number: true, description: d} -> "[#{lc}#{uc}<task_number>] #{d}"
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
