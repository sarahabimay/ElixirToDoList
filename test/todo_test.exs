defmodule ToDoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ToDo

  test "run the app and exit" do
    user_input = "e\n"
    capture_io([input: user_input], fn ->
      assert ToDo.Runner.run == :ok
    end)
  end

  test "run the app, add a new task then exit" do
    user_input = "a\nGet Edit working\n\ne"
    capture_io([input: user_input], fn ->
      assert ToDo.Runner.run == :ok
    end)
  end
end
