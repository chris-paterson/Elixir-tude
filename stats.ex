defmodule Stats do

  def minimum(numbers) do
    [head | tail] = numbers
    minimum(tail, head)
  end

  def maximum(numbers) do
    [head | tail] = numbers
    maximum(tail, head)
  end

  def range(numbers) do
    max = maximum(numbers)
    min = minimum(numbers)
    [min, max]
  end

  defp minimum([], candidate), do: candidate
  defp minimum(list, candidate) do
    [latest | rest_of_numbers] = list
    cond do
      latest < candidate -> minimum(rest_of_numbers, latest)
      true -> minimum(rest_of_numbers, candidate)
    end
  end

  defp maximum([], candidate), do: candidate
  defp maximum(list, candidate) do
    [latest | rest_of_numbers] = list
    cond do
      latest > candidate -> maximum(rest_of_numbers, latest)
      true -> maximum(rest_of_numbers, candidate)
    end
  end
end