defmodule Dates do
  
  def date_parts(iso_date) do
    String.split(iso_date, ~r/-/)
    |> Enum.map(&(String.to_integer &1))
  end

  def julian(iso_date) do
    [year, month, day] = date_parts(iso_date)
    days_for_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    total_days_for_full_months = month_total(month, days_for_month, 0) + day
    cond do
      is_leap_year(year) and month > 2 -> total_days_for_full_months + 1
      true -> total_days_for_full_months
    end
  end

  defp month_total(1, _days_per_month, accumulator), do: accumulator
  defp month_total(month_number, days_per_month, accumulator) do
    [days_for_month | remaining_months] = days_per_month
    month_total(month_number - 1, remaining_months, accumulator + days_for_month)
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end
end
