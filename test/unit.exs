ExUnit.start

defmodule CombinatorEx.Test.Numbers do
  use ExUnit.Case
  alias CombinatorEx.Comb, as: CC

  test "basic binomial coefficients" do
    IO.puts "Basic binomial coefficient tests"
    assert CC.c(1,3) == 0
    assert CC.c(2,3) == 0
    assert CC.c(3,3) == 1
    assert CC.c(4,3) == 4
    assert CC.c(5,3) == 10
  end

  test "binomial coefficients properties" do
    ns = :lists.seq(97, 100, 1)
    ks = :lists.seq(58, 60, 1)
    Enum.all? ns, fn(n) ->
      Enum.all? ks, fn(k) ->
        IO.puts "Testing C(#{n},#{k}):"
        IO.puts "Testing k ←→ n-k case:"
        assert CC.c(n, k) == CC.c(n, n-k)
        Enum.all? :lists.seq(k-3, k-1), fn(b) -> 
          IO.puts "Testing #{b}-splicing"
          cnk = CC.c(n, k)
          cnb = CC.c(n, b)
          cmb = CC.c(n-b,k-b)
          ckb = CC.c(k, b)
          res = div (cnb * cmb), ckb
          IO.puts "(n,k) #{cnk} = #{res} (#{cnb} * #{cmb} / #{ckb})"
          assert cnk == res
          #CC.c(n,k) == CC.c(n, b) * CC.c(n-b,k-b) / CC.c(k, b)
        end
      end
    end
  end
end
