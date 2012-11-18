defmodule CombinatorEx.Comb do
  def c(n, k) when is_integer(n) and is_integer(k) do 
    CombinatorEx.Comb.Numbers.c(n, k)
  end

  def c(k, l) when is_integer(k) and is_list(l) do
      if ((k > 0) && (length(l) > 0) && (length(l) >= k)) do
        CombinatorEx.Comb.Lists.c(k, l)
      else
        if (k == 0) do
          [[]]
        else
          []
        end
    end
  end

  def c(l) when is_list(l) do
    CombinatorEx.Comb.Lists.c(l)
  end
end
