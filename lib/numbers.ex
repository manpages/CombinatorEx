defmodule CombinatorEx.Comb.Numbers do
  def c(n, k) when is_integer(n) and is_integer(k) do 
    if ((n > 0) && (k > 0) && (n >= k)) do
      c(n, k, 1, 1)
    else
      0
    end
  end

  defp c(n, k, k, acc0) do 
    div (acc0 * (n-k+1)), k
  end
  
  defp c(n, k, i, acc0) do 
    c(n, k, i+1, (div acc0 * (n-i+1), i))
  end

end
