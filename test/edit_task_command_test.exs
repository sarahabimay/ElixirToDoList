defmodule ToDo.EditTaskCommandTest do
  use ExUnit.Case
  doctest ToDo

  test "it changes a selected task" do
    task1 = "Be more careful when running."
    task2 = "Don't break any more bones."
    task3 = "Don't wake up at 04:00."
    task_list = [ task1, task2, task3]
    task_number1 = "1"
    amended_task = "Be more careful."
    expected_result = [amended_task, task2, task3]
    assert ToDo.EditTaskCommand.edit_task(task_number1, amended_task, task_list) == expected_result
  end
end
