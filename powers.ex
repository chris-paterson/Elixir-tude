defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(_, 0), do: 1
  def raise(x, n) when n > 0, do: raise(x, n, 1)
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)

  defp raise(_x, 0, acc), do: acc
  defp raise(x, n, acc), do: raise(x, n - 1, x * acc)

  def nth_root(x, n), do: nth_root(x, n, x / 2.0)
  defp nth_root(x, n, approx) do
    IO.puts("Current guess is #{approx}")
    f = raise(approx, n) - x
    f_prime = n * raise(approx, n - 1)
    next = approx - f / f_prime
    change = abs(approx - next)
    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end