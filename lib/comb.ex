defmodule CombinatorEx.Comb do
  def c(n, k) when is_integer(n) and is_integer(k) do 
    CombinatorEx.Comb.Numbers.c(n, k)
  end

  def c(k, l) when is_integer(k) and is_list(l) do
    CombinatorEx.Comb.Lists.cid(k, l)
  end

  def c(l) when is_list(l) do
    CombinatorEx.Comb.Lists.c(l)
  end

  def cfoldl(l, k) when is_list(l) and is_integer(k) do
    CombinatorEx.Comb.Lists.cfoldl(k, l)
  end
end
