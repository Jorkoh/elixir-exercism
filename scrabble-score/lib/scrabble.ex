defmodule Scrabble do
  @scoring [
    {["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1},
    {["D", "G"], 2},
    {["B", "C", "M", "P"], 3},
    {["F", "H", "V", "W", "Y"], 4},
    {["K"], 5},
    {["J", "X"], 8},
    {["Q", "Z"], 10}
  ]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.trim()
    |> String.upcase()
    |> String.graphemes()
    |> Enum.reduce(0, fn l, acc ->
      elem(Enum.find(@scoring, fn {letters, _score} -> l in letters end), 1) + acc
    end)
  end
end
