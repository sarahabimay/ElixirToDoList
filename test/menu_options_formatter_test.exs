defmodule MenuOptionsFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.MenuOptionsFormatter

  setup do
    menu =
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Tasks\n" <>
      "[bB] List All Tasks\n" <>
      "[cC<task_number>] Edit Task\n" <>
      "[dD<task_number>] Delete Task\n" <>
      "[eE] Exit\n"

      {:ok, menu_options: menu}
  end

  test "command menu options for display", context do
    assert menu_options_for_display == context[:menu_options]
  end
end
