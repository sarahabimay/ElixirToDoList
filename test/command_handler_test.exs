defmodule CommandHandlerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.CommandHandler
  doctest ToDo

  test "valid 'add to-do task' command" do
    add_command = "a"
    new_task = "Buy present for Granny's birthday."

    result = capture_io([input: new_task], fn ->
      input = action_command(add_command)
      IO.write input
    end)
    assert result == "New To-Do Task: > #{new_task}"
  end

  test "ignores unrecognized command" do
    invalid_command = "9"
    result = capture_io(fn ->
      action_command(invalid_command)
    end)
    assert result == "Sorry, I don't recognize that command.\n"
  end
end
