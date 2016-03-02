defmodule ToDoListAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  defmodule IOAssert do
    def assert_with_input(input, action_fn) do
     capture_io([input: input], fn ->
       action_fn.()
     end)
    end
  end

  defmodule ToDoListAppAssert do
    def add_new_tasks(tasks, expected_result) do
      fn -> assert ToDo.ToDoListApp.get_new_tasks(tasks, :add) == expected_result end
    end

    def process_command(command, tasks, expected_result) do
      fn -> assert ToDo.ToDoListApp.process_command(command, tasks) == expected_result end
    end

    def run(tasks, expected_result) do
      fn -> assert ToDo.ToDoListApp.run(tasks) == expected_result end
    end
  end

  setup do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    task_list = [task1, task2, task3]
    {:ok, task1: task1, task2: task2, task3: task3, tasks: task_list}
  end

  test "it can add new tasks" do
    tasks = []
    new_task1 = "Finish Todo List"
    new_task2 = "Add delete task"
    user_input = "#{new_task1}\n#{new_task2}\n\n"
    expected_result = [new_task1, new_task2]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.add_new_tasks(tasks, expected_result))
  end

  test "user adds two tasks then quits" do
    user_input = "a\nFinish Todo List\nWrite blog\n\ne"
    tasks = []
    expected_result = :ok
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.run(tasks, expected_result))
  end

  test "it can list all to do tasks", context do
    user_input = "\ne"
    command = :list_tasks
    tasks = context[:tasks]
    expected_result = {:list_tasks, [context[:task1], context[:task2], context[:task3]]}
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end

  test "it can edit a task", context do
    task_number = "1"
    command = {:edit, task_number}
    tasks = context[:tasks]
    new_text = "New text"
    user_input = "#{new_text}\ne"
    expected_result = [new_text, context[:task2], context[:task3]]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end

  test "it can delete a task", context do
    task_number = "1"
    command = {:delete, task_number}
    tasks = context[:tasks]
    new_text = "New text"
    user_input = "#{new_text}\ne"
    expected_result = [context[:task2], context[:task3]]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end
end
