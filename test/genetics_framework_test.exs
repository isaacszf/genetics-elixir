defmodule GeneticsFrameworkTest do
  use ExUnit.Case
  doctest GeneticsFramework

  test "greets the world" do
    assert GeneticsFramework.hello() == :world
  end
end
