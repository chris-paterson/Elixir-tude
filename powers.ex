defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(_, 0), do: 1
  def raise(x, n) when n > 0, do: raise(x, n, 1)
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)

  defp raise(_x, 0, acc), do: acc
  defp raise(x, n, acc), do: raise(x, n - 1, x * acc)
end