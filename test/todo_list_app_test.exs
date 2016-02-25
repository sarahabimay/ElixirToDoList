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

  test "it maps 'e' menu option to ':exit' command" do
    exit = "e"
    capture_io(fn ->
      assert option_to_command(exit, []) == :exit
    end)
  end

  test "enter add command and new task" do
    user_input = "Finish Todo List\n\n"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert get_new_tasks([], :add) == [[], "Finish Todo List"]
    end)
  end

  test "user enters two tasks then quits" do
    user_input = "a\nFinish Todo List\nWrite blog\n\ne"
    capture_io([input: user_input, capture_prompt: false], fn ->
      assert todo_list_run([]) == :ok
    end)
  end
end
