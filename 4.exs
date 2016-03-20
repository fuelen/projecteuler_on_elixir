defmodule Task4 do
  def palindrome?(n) do
    to_string(n) == String.reverse(to_string(n))
  end

  def largest_number_with_n_digits(n) do
    String.to_integer(Enum.join(List.duplicate(["9"], n)))
  end

  def largest_palindrome_product_witn_n_digits(n) do
    Enum.max(for a <- 1..largest_number_with_n_digits(n),
                 b <- 1..largest_number_with_n_digits(n),
                 palindrome?(a * b),
                 do: a * b)
  end
end

IO.inspect Task3.largest_palindrome_product_witn_n_digits(2)
IO.inspect Task3.largest_palindrome_product_witn_n_digits(3)
