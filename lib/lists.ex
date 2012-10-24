defmodule CombinatorEx.Comb.Lists do
  def c(k, l) when is_integer(k) and is_list(l) do
    cond do
      ((k >= 0) && (length(l) >= 0) && (length(l) >= k)) ->
        _c(k, l)
      true ->
        []
    end
  end

  defp _c(1, l), do: lc x inlist l, do: [x]
  defp _c(k, l) when k == length(l), do: [l]
  defp _c(k, [h|t]), do: (lc subc inlist _c(k-1, t), do: [h|subc]) ++ _c(k, t)
end
