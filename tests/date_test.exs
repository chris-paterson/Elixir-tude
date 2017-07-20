ExUnit.start
defmodule DatesTest do
  use ExUnit.Case, async: true

  test "date gets correctly split" do
    assert Dates.date_parts("2013-06-15") == [2013, 6, 15]
  end
end