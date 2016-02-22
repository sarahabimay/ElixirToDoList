defmodule ItemsFormatterTest do
  use ExUnit.Case
  doctest ToDo
  import ToDo.ItemsFormatter

  setup do
    item1 = "Go to yoga tonight"
    item2 = "make to do list app"

    items = [ item1, item2 ]

    empty_for_display = "To Do List:\n\n"

    items_for_display =
      "To Do List:\n" <>
     "[1] #{item1}\n" <>
     "[2] #{item2}\n"

    {:ok, items: items, unpopulated_todo: empty_for_display, populated_todo: items_for_display}
  end

  test "to do menu options displayed with no items", context do
    assert items_for_display([]) == context[:unpopulated_todo]
  end

  test "to do menu options displayed with two items", context do
    assert items_for_display(context[:items]) == context[:populated_todo]
  end
end
