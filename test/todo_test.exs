defmodule ToDoTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import ToDo.ToDo
  doctest ToDo

  test "display includes To Do list" do
    result = capture_io fn ->
      run
    end
    assert String.contains?(result, "To Do List:\n")
  end

  test "display includes Commands menu" do
    result = capture_io fn ->
      run
    end
    assert String.contains?(result, "Commands Cheatsheet:\n")
  end
end
