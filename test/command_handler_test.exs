defmodule CommandHandlerTest do
  use ExUnit.Case
  import ToDo.CommandHandler
  doctest ToDo

  test "it has an 'add new task' command" do
    tasks = ""
    new_task = "Buy present for Granny's birthday."
    assert action_command({:add, new_task}, tasks) == ["", new_task]
  end

  test "it has a 'delete task' command" do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    tasks = [task1, task2, task3]
    task_number1 = 1
    assert action_command({:delete, task_number1}, tasks) == [task2, task3]
  end

  test "ignores unrecognized command" do
    tasks = ""
    invalid_command = "9"
    assert action_command({invalid_command}, tasks) == "Sorry, I don't recognize that command."
   end
end
