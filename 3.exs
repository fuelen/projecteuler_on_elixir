defmodule Math do
  def prime_factors(number, factor \\ 2)

  def prime_factors(number, _) when number == 1 do
    []
  end

  def prime_factors(number, factor) when rem(number, factor) == 0 do
    [factor] ++ prime_factors(round(number / factor), factor)
  end

  def prime_factors(number, factor) do
    prime_factors(number, factor + 1)
  end
end

IO.inspect Enum.max(Math.prime_factors(13_195))
IO.inspect Enum.max(Math.prime_factors(600_851_475_143))
