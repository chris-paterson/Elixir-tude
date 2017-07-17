defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.
  """
  @vsn 0.1

  @doc """
  Calculates the area of a shape, given the shape and two of the
  dimensions. Returns the product of its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for an ellipse.
  """

  @spec area(atom(), number(), number()) :: number()

  def area(shape, num1, num2) when num1 >= 0 and num2 >= 0 do 
    case shape do
      :rectangle -> num1 * num2
      :triangle -> num1 * num2 / 2
      :ellipse -> :math.pi() * num1 * num2
      _ -> 0
    end
  end
  def area(_, _, _), do: 0
end
