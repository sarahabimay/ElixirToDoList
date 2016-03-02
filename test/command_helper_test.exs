defmodule CommandHelperTest do
  use ExUnit.Case
  doctest ToDo

  test "apply delete to a task in task list" do
    task1 = "Go to doctors"
    task2 = "Return library books"
    task3 = "Return toy to the shop"
    tasks = [task1, task2, task3]
    task_id = "1"
    delete = fn -> fn(tasks, task_number) -> List.delete_at(tasks, task_number - 1) end end
    expected = [task2, task3]
    assert ToDo.CommandHelper.apply_command_to_task(task_id, tasks, delete.()) == expected
  end

  test "apply edit to a task in task list" do
    task1 = "Go to doctors"
    task2 = "Return library books"
    task3 = "Return toy to the shop"
    tasks = [task1, task2, task3]
    task_id = "1"
    amended_text = "Go to Physio"
    edit = fn(amended_text) -> fn(tasks, task_number) -> List.replace_at(tasks, task_number - 1, amended_text) end end
    expected = [amended_text, task2, task3]
    assert ToDo.CommandHelper.apply_command_to_task(task_id, tasks, edit.(amended_text)) == expected
  end
end
