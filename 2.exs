require Integer

defmodule Math do
  def fibonacci(first_value, second_value, max_value) when second_value >= max_value do
    [first_value]
  end

  def fibonacci(first_value, second_value, max_value) do
    [first_value] ++ fibonacci(second_value, first_value + second_value, max_value)
  end
end

even? = &Integer.is_even/1
IO.inspect Math.fibonacci(1,2, 4_000_000)
IO.inspect Enum.filter(Math.fibonacci(1,2, 4_000_000), even?)
IO.inspect Enum.sum(Enum.filter(Math.fibonacci(1,2, 4_000_000), even?))
