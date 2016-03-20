# Math module from task3
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

all_prime_factors = Enum.map(1..20, &Math.prime_factors/1)

uniq_prime_factors = Enum.uniq(List.flatten(all_prime_factors))
filter_by_element_of_list = fn(source, member) -> Enum.filter(source, &Enum.member?(&1, member)) end

select_most_density = fn
  (list_of_lists, n) -> Enum.max_by(list_of_lists, fn(list) -> length(Enum.filter(list, fn(el) -> el == n end)) end)
end

most_densitiest_factors =  Enum.map(uniq_prime_factors, &select_most_density.(filter_by_element_of_list.(all_prime_factors, &1), &1))
IO.inspect Enum.reduce(List.flatten(most_densitiest_factors), 1, &*/2)
