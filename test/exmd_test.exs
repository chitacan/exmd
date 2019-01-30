defmodule ExmdTest do
  use ExUnit.Case
  doctest Exmd

  test "greets the world" do
    assert Exmd.hello() == :world
  end
end
