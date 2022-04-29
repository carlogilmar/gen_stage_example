defmodule WordleTest do
  use ExUnit.Case
  doctest Wordle

  test "greets the world" do
    assert Wordle.hello() == :world
  end
end
