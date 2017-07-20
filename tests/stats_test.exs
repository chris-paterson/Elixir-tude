ExUnit.start
defmodule StatsTest do
  use ExUnit.Case, async: true

  @data [4, 1, 7, -17, 8, 2, 5]

  test "minimum works correctly" do
    assert Stats.minimum(@data) == -17
    assert Stats.minimum([52, 46]) == 46
  end

  test "maximum works correctly" do
    assert Stats.maximum(@data) == 8
  end

  test "range works correctly" do
    assert Stats.range(@data) == [-17, 8]
  end
end