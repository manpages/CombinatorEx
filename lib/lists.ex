defmodule CombinatorEx.Comb.Lists do
  def cmap(k, l, f) when is_integer(k) and is_list(l) do
    if ((k > 0) && (length(l) > 0) && (length(l) >= k)) do
      _cmap(k, l, f)
    else
      if (k == 0) do
        [[]]
      else
        []
      end
    end
  end

  def cid(k, l), do: cmap(k, l, fn(x) -> x end)

  defp _cmap(1, l, f) do
    lc x inlist l, do: [f.(x)]
  end

  defp _cmap(k, l, f) when k == length(l) do
    [Enum.map(l, f)]
  end
  defp _cmap(k, [h|t], f) do 
    IO.puts("body")
    (lc subc inlist _cmap(k-1, t, f), do: [f.(h)|subc]) ++ _cmap(k, t, f)
  end
end
