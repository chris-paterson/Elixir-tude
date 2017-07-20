defmodule AskArea do
  @moduledoc """
  Command line utility for finding the area of various shapes.
  """

  @doc """
  Asks for shape, dimenion x, and dimension y then prints the result

  iex> AskArea.area()
  R)ectangle, T)riangle, or E)llipse: r
  Enter width > 4
  Enter height > 3
  12
  """

  def area() do
    shape_char = get_shape_char()
    shape = char_to_shape(shape_char)

    {dimen1, dimen2} = case shape do
      :rectangle -> get_dimensions("height", "width")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("major radius", "minor radius")
      :unknown -> { shape_char, 0 }
    end
    calculate(shape, dimen1, dimen2) |> IO.puts
  end

  defp get_shape_char() do
    shape = get_input "R)ectangle, T)riangle, or E)llipse: "
    shape
    |> String.first
    |> String.downcase
  end

  defp char_to_shape(shape_char) do
    case shape_char do
      "r" -> :rectangle
      "t" -> :triangle
      "e" -> :ellipse
      _ -> :unknown
    end
  end

  defp get_dimensions(dimen1, dimen2) do
    n1 = dimen1 |> get_number
    n2 = dimen2 |> get_number
    {n1, n2}
  end

  defp get_number(property_name) do
    number = get_input "Enter #{property_name} >"
    String.to_integer(number)
  end

  defp calculate(shape, dimen1, dimen2) do
    cond do
      shape == :unknown -> IO.puts("Unknown shape #{dimen1}")
      dimen1 < 0 or dimen2 < 0 -> cancel "Both numbers must be greater than or equal to zero."
      true -> Geom.area shape, dimen1, dimen2
    end
  end

  defp get_input(prompt) do
    input = IO.gets "#{prompt} "
    input |> String.strip
  end

  defp cancel(message), do: message |> IO.puts
end