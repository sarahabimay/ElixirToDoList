defmodule CommandHandlerTest do
  use ExUnit.Case
  import ToDo.CommandHandler
  doctest ToDo

  test "valid 'add new task' command" do
    new_task = "Buy present for Granny's birthday."
    assert action_command({:add, new_task}, "") == ["", new_task]
  end

  test "ignores unrecognized command" do
    invalid_command = "9"
    assert action_command({invalid_command}, "") == "Sorry, I don't recognize that command."
   end
end
