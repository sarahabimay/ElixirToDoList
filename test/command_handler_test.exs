defmodule CommandHandlerTest do
  use ExUnit.Case
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
    assert ToDo.CommandHandler.action_command({:add, new_task}, tasks) == ["", new_task]
  end

  test "it has a 'delete task' command", context do
    task_number1 = 1
    expected_results = [context[:task2], context[:task3]]
    assert ToDo.CommandHandler.action_command({:delete, task_number1}, context[:tasks]) == expected_results
  end

  test "it has a 'list all tasks' command", context do
    heading = "\nYour To Do List:\n"
    task1 = "[1] #{context[:task1]}\n"
    task2 = "[2] #{context[:task2]}\n"
    task3 = "[3] #{context[:task3]}\n"

    expected_display = heading <> task1 <> task2 <> task3
    assert ToDo.CommandHandler.action_command({:list_tasks}, context[:tasks]) == expected_display
  end

  test "it has an 'edit task' command", context do
    task_number1 = 1
    new_text = "Buy Lego"
    expected_result = [new_text, context[:task2], context[:task3]]
    assert ToDo.CommandHandler.action_command({:edit, task_number1, new_text}, context[:tasks]) == expected_result
    end

  test "ignores unrecognized command" do
    tasks = ""
    invalid_command = "9"
    assert ToDo.CommandHandler.action_command({invalid_command}, tasks) == "Sorry, I don't recognize that command."
   end
end
