defmodule OcrDemoTest do
  use ExUnit.Case
  doctest OcrDemo

  test "greets the world" do
    assert OcrDemo.hello() == :world
  end
end
