IO.inspect Enum.sum(Enum.filter(1..999, fn(n) -> rem(n, 5) == 0 || rem(n, 3) == 0 end))
# or
zero_rem_for_any_of? = fn(list, number) -> Enum.any?(list, fn(x) -> rem(number, x) == 0 end) end
zero_rem_for_3_or_5? = fn(number) -> zero_rem_for_any_of?.([3,5], number) end

IO.inspect Enum.sum(Enum.filter(1..999, zero_rem_for_3_or_5?))
# or
IO.inspect Enum.sum(for n <- 1..999, zero_rem_for_3_or_5?.(n), do: n)
