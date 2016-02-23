defmodule DeleteTaskCommandTest do
  use ExUnit.Case
  import ToDo.DeleteTaskCommand
  doctest ToDo

  setup do
    task1 = "Be more careful when running."
    task2 = "Don't break any more bones."
    task3 = "Don't wake up at 04:00."
    task_list = [ task1, task2, task3]
    {:ok, task_list: task_list, task1: task1, task2: task2, task3: task3}
  end

  test "it removes a task from task list", context do
    task_number1 = 1
    assert delete_task(task_number1, context[:task_list]) == [context[:task2], context[:task3]]
  end

  test "it returns unchanged task list for non-integer task_number", context do
    invalid_task_number = "1"
    assert delete_task(invalid_task_number, context[:task_list]) == [context[:task1], context[:task2], context[:task3]]
  end

  test "it returns unchanged task list for invalid task_number", context do
    invalid_task_number = 0
    assert delete_task(invalid_task_number, context[:task_list]) == [context[:task1], context[:task2], context[:task3]]
  end
end
