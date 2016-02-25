defmodule ToDo.EditTaskCommandTest do
  use ExUnit.Case
  import ToDo.EditTaskCommand
  doctest ToDo

  setup do
    task1 = "Be more careful when running."
    task2 = "Don't break any more bones."
    task3 = "Don't wake up at 04:00."
    task_list = [ task1, task2, task3]
    {:ok, task_list: task_list, task1: task1, task2: task2, task3: task3}
  end

  test "it changes a selected task", context do
    task_number1 = "1"
    amended_task = "Be more careful."
    expected_result = [amended_task, context[:task2], context[:task3]]
    assert edit_task(task_number1, amended_task, context[:task_list]) == expected_result
  end
end
