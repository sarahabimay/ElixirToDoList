defmodule ToDo.CommandHandler do
  import ToDo.ConsoleDisplay

  def action_command(command) do
    command_upper = String.capitalize(command)
    case command_upper do
     _ when command_upper == "A" -> action_add_tasks
     _ when command_upper == "B" -> action_task_list
     _ when command_upper == "C" -> action_edit_task
     _ when command_upper == "D" -> action_delete_task
     _ when command_upper == "E" -> action_exit
     _ -> action_invalid_command
    end
  end

  defp action_add_tasks do
    display_get("New To-Do Task: > ")
  end

  defp action_task_list do
  end

  defp action_edit_task do
  end

  defp action_delete_task do
  end

  defp action_exit do
  end

  defp action_invalid_command do
    display_put("Sorry, I don't recognize that command.")
  end
end
