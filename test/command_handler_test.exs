defmodule CommandHandlerTest do
  use ExUnit.Case
  import ToDo.CommandHandler
  doctest ToDo

  setup do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    tasks = [task1, task2, task3]
    {:ok, task1: task1, task2: task2, task3: task3, tasks: tasks}
  end

  test "it has an 'add new task' command" do
    tasks = ""
    new_task = "Buy present for Granny's birthday."
    assert action_command({:add, new_task}, tasks) == ["", new_task]
  end

  test "it has a 'delete task' command", context do
    task_number1 = 1
    assert action_command({:delete, task_number1}, context[:tasks]) == [context[:task2], context[:task3]]
  end

  test "it has an 'edit task' command", context do
    task_number1 = 1
    new_text = "Buy Lego"
    assert action_command({:edit, task_number1, new_text}, context[:tasks]) == [new_text, context[:task2], context[:task3]]
  end

  test "ignores unrecognized command" do
    tasks = ""
    invalid_command = "9"
    assert action_command({invalid_command}, tasks) == "Sorry, I don't recognize that command."
   end
end
