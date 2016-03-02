defmodule ConsoleDisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  defmodule IOAssert do
    def assert_with_input(input, action_fn) do
     capture_io([input: input], fn ->
       action_fn.()
     end)
    end

    def stdout_assert(action_fn, assert_fn) do
     capture_io(fn ->
       action_fn.()
     end)
     |> assert_fn.()
    end
  end

  defmodule CommandHandler do
    def option_to_command(option, expected) do
      fn ->
        assert ToDo.CommandHandler.option_to_command(option) == expected
      end
    end
  end

  test "display contains the 'To Do List' heading" do
    action_fn = fn -> ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([]) end
    assert_fn = fn(result) -> assert String.contains?(result, "To Do List") end
    IOAssert.stdout_assert(action_fn, assert_fn)
  end

  test "display contains 'Commands Cheatsheet' heading" do
    action_fn = fn -> ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet([]) end
    assert_fn = fn(result) -> assert String.contains?(result, "Commands Cheatsheet") end
    IOAssert.stdout_assert(action_fn, assert_fn)
  end

  test "display contains a task in the 'To-Do list'" do
    todo_tasks = ["Go to yoga tonight"]
    action_fn = fn(tasks) -> fn -> ToDo.ConsoleDisplay.display_to_do_list_and_cheatsheet(tasks) end end
    assert_fn = fn(result) -> assert String.contains?(result, "[1] #{todo_tasks}\n") end
    IOAssert.stdout_assert(action_fn.(todo_tasks), assert_fn)
  end

  test "invalid menu option is ignored" do
   user_input = "e"
   option = "9"
   expected = :invalid
   IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "'a' menu option is valid" do
    user_input = ""
    option = "a"
    expected = :add
    IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "'b' menu option is valid" do
    user_input = ""
    option = "b"
    expected = :list_tasks
    IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "'c' menu option is valid" do
    user_input = ""
    option = "c 1"
    expected = {:edit, "1"}
    IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "'d' menu option is valid" do
    user_input = ""
    option = "d 1"
    expected = {:delete, "1"}
    IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "'e' menu option is valid" do
    user_input = ""
    option = "e"
    expected = :exit
    IOAssert.assert_with_input(user_input, CommandHandler.option_to_command(option, expected))
  end

  test "input received from prompt" do
    user_input = "a"
    expected = :add
    prompt_for_command = fn(expected) -> fn -> assert ToDo.ConsoleDisplay.prompt_for_command == expected end end
    IOAssert.assert_with_input(user_input, prompt_for_command.(expected))
  end
end
