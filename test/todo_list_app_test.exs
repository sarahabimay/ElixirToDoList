defmodule ToDoListAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ToDoListApp
  doctest ToDo

  setup do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    task_list = [task1, task2, task3]
    {:ok, task1: task1, task2: task2, task3: task3, tasks: task_list}
  end

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

  test "it maps 'b' menu option to ':list_tasks' command" do
    option = "b"
    capture_io(fn ->
      assert option_to_command(option, []) == :list_tasks
    end)
  end

  test "it maps 'c' menu option to ':edit' command" do
    option = "c 1"
    capture_io(fn ->
      assert option_to_command(option, []) == {:edit, "1"}
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
    expected_result = [new_task1, new_task2]
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert get_new_tasks([], :add) == expected_result
    end)
  end

  test "it can list all to do tasks with the list_tasks command", context do
    user_input = "\ne"
    expected_result = {:list_tasks, [context[:task1], context[:task2], context[:task3]]}
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert process_command(:list_tasks, context[:tasks]) == expected_result
    end)
  end

  test "it can edit a task with the edit command", context do
    task_number = 1
    new_text = "New text"
    user_input = "#{new_text}\ne"
    expected_result = [new_text, context[:task2], context[:task3]]
    capture_io([input: user_input], fn ->
      assert process_command({:edit, task_number}, context[:tasks]) == expected_result
    end)
  end

  test "it can delete a task with the delete command", context do
    task_number = 1
    expected_result = [context[:task2], context[:task3]]
    assert process_command({:delete, task_number}, context[:tasks]) == expected_result
  end

  test "user enters two tasks then quits" do
    user_input = "a\nFinish Todo List\nWrite blog\n\ne"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert todo_list_run([]) == :ok
    end)
  end
end
