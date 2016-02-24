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
    def option_to_command(option, tasks, expected) do
      fn ->
        assert ToDo.ToDoListApp.option_to_command(option, tasks) == expected
      end
    end

    def add_new_tasks(tasks, expected_result) do
      fn ->
        assert ToDo.ToDoListApp.get_new_tasks(tasks, :add) == expected_result
      end
    end

    def process_command(command, tasks, expected_result) do
      fn ->
        assert ToDo.ToDoListApp.process_command(command, tasks) == expected_result
      end
    end

    def todo_list_run(tasks, expected_result) do
      fn ->
        assert ToDo.ToDoListApp.todo_list_run(tasks) == expected_result
      end
    end
  end

  setup do
    task1 = "Buy presents"
    task2 = "Make a cake"
    task3 = "Get party hats"
    task_list = [task1, task2, task3]
    {:ok, task1: task1, task2: task2, task3: task3, tasks: task_list}
  end

  test "captureIO fn works" do
   user_input = ""
   option = "a"
   tasks = []
   expected = :add
   IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps '9' to nothing" do
   user_input = "e"
   option = "9"
   tasks = []
   expected = :ok
   IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps 'a' menu option to ':add' command" do
    user_input = ""
    option = "a"
    tasks = []
    expected = :add
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps 'b' menu option to ':list_tasks' command" do
    user_input = ""
    option = "b"
    tasks = []
    expected = :list_tasks
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps 'c' menu option to ':edit' command" do
    user_input = ""
    option = "c 1"
    tasks = []
    expected = {:edit, "1"}
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps 'd' menu option to ':delete' command" do
    user_input = ""
    option = "d 1"
    tasks = []
    expected = {:delete, "1"}
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it maps 'e' menu option to ':exit' command" do
    user_input = ""
    option = "e"
    tasks = []
    expected = :exit
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.option_to_command(option, tasks, expected))
  end

  test "it can add new tasks with the add command" do
    tasks = []
    new_task1 = "Finish Todo List"
    new_task2 = "Add delete task"
    user_input = "#{new_task1}\n#{new_task2}\n\n"
    expected_result = [new_task1, new_task2]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.add_new_tasks(tasks, expected_result))
  end

  test "it can list all to do tasks with the list_tasks command", context do
    user_input = "\ne"
    command = :list_tasks
    tasks = context[:tasks]
    expected_result = {:list_tasks, [context[:task1], context[:task2], context[:task3]]}

    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end

  test "it can edit a task with the edit command", context do
    task_number = 1
    command = {:edit, task_number}
    tasks = context[:tasks]
    new_text = "New text"
    user_input = "#{new_text}\ne"
    expected_result = [new_text, context[:task2], context[:task3]]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end

  test "it can delete a task with the delete command", context do
    task_number = 1
    command = {:delete, task_number}
    tasks = context[:tasks]
    new_text = "New text"
    user_input = "#{new_text}\ne"
    expected_result = [context[:task2], context[:task3]]
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.process_command(command, tasks, expected_result))
  end

  test "user enters two tasks then quits" do
    user_input = "a\nFinish Todo List\nWrite blog\n\ne"
    tasks = []
    expected_result = :ok
    IOAssert.assert_with_input(user_input, ToDoListAppAssert.todo_list_run(tasks, expected_result))
  end
end
