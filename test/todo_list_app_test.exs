defmodule ToDoListAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ToDoListApp
  doctest ToDo

  test "it maps '9' to nothing" do
    option = "9"
    user_input = "e\n"
    capture_io([input: user_input], fn ->
      assert option_to_command(option, []) == :ok
    end)
  end

  test "it maps 'a' menu option to ':add' command" do
    option = "a"
    capture_io(fn ->
      assert option_to_command(option, []) == :add
    end)
  end

  test "it maps 'd' menu option to ':delete' command" do
    option = "d 1"
    capture_io(fn ->
      assert option_to_command(option, []) == {:delete, "1"}
    end)
  end

  test "it maps 'e' menu option to ':exit' command" do
    exit = "e"
    capture_io(fn ->
      assert option_to_command(exit, []) == :exit
    end)
  end

  test "it can add new tasks with the add command" do
    new_task1 = "Finish Todo List"
    new_task2 = "Add delete task"
    user_input = "#{new_task1}\n#{new_task2}\n\n"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert get_new_tasks([], :add) == [new_task1, new_task2]
    end)
  end

  test "it can delete a task with the delete command" do
    task_number = 1
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    task_list = [task1, task2, task3]
    assert process_command({:delete, task_number}, task_list) == [task2, task3]
  end

  test "user enters two tasks then quits" do
    user_input = "a\nFinish Todo List\nWrite blog\n\ne"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert todo_list_run([]) == :ok
    end)
  end
end
