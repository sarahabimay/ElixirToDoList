defmodule MenuOptionsFormatterTest do
  use ExUnit.Case
  doctest ToDo

  test "command menu options for display" do
    menu =
      "Commands Cheatsheet:\n" <>
      "[aA] Add New To-Do Tasks\n" <>
      "[bB] List All Tasks\n" <>
      "[cC<space>task_number] Edit Task\n" <>
      "[dD<space>task_number] Delete Task\n" <>
      "[eE] Exit\n"

    assert ToDo.MenuOptionsFormatter.menu_options_for_display == menu
  end
end
