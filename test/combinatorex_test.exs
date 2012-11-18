defmodule CombinatorEx.Test.Numbers do
  use ExUnit.Case
  alias CombinatorEx.Comb, as: CC

  test "basic binomial coefficients" do
    IO.puts ""
    IO.puts "Basic binomial coefficient tests"
    assert CC.c(1,3) == 0
    assert CC.c(2,3) == 0
    assert CC.c(3,3) == 1
    assert CC.c(4,3) == 4
    assert CC.c(5,3) == 10
  end

  test "some extremal cases" do
    IO.puts ""
    assert CC.c(3,5) == 0 # should we raise an error here?
    assert CC.c(0,3) == 0 # maybe raise error?
    assert CC.c(9,0) == 1
    assert CC.c(0,0) == 1 # there is one way to select nothing from empty set
  end

  test "binomial coefficients properties" do
    IO.puts ""
    IO.puts "Tests of some important properties"
    ns = :lists.seq(97, 100, 1)
    ks = :lists.seq(58, 60, 1)
    Enum.all? ns, fn(n) ->
      Enum.all? ks, fn(k) ->
        assert CC.c(n, k) == CC.c(n, n-k)
        Enum.all? :lists.seq(k-3, k-1), fn(b) -> 
          CC.c(n,k) == div(CC.c(n, b) * CC.c(n-b,k-b), CC.c(k, b))
        end
      end
    end
  end
end

defmodule CombinatorEx.Test.Lists do
  use ExUnit.Case
  alias CombinatorEx.Comb, as: CC

  test "basic combination lists" do
    IO.puts ""
    IO.puts "Basic combination lists"
    assert :erlang.length(CC.c(3, [:a,:b,:c,:d,:e])) == 10
    #todo: write full test to match lists.
  end

  test "some extremal cases" do
    IO.puts ""
    assert :erlang.length(CC.c(5, [:a,:b,:c])) == 0 # maybe raise error?
  end
end
