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

  def area(:rectangle, length, width), do: length * width
  def area(:triangle, base, height), do: base * height / 2
  def area(:ellipse, major_radius, minor_radius), do: :math.pi * major_radius * minor_radius
end
