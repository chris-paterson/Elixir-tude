defmodule Geom do
  @moduledoc """
  Contains geometric operations.
  """

  @doc """
  Calculates the area of a rectangle. 
  Takes length \\ 1 and width \\ 1
  """

  @spec area(number(), number()) :: number()
  def area(length \\ 1, width \\ 1), do: length * width 
end
