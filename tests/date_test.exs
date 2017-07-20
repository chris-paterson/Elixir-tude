ExUnit.start
defmodule DatesTest do
  use ExUnit.Case, async: true

  test "date gets correctly split" do
    assert Dates.date_parts("2013-06-15") == [2013, 6, 15]
  end

  test "julian gives correct date" do
    assert Dates.julian("2013-12-31") == 365
    assert Dates.julian("2013-02-05") == 36
    assert Dates.julian("1900-03-01") == 60
    assert Dates.julian("2013-01-01") == 1
  end

  test "julian gives correct date for leap year" do
    assert Dates.julian("2012-12-31") == 366
    assert Dates.julian("2000-03-01") == 61
    assert Dates.julian("2012-02-05") == 36
  end
end