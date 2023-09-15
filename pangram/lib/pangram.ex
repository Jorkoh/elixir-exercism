defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(""), do: false
  def pangram?(s) do
    graphemes = s |> String.downcase() |> String.graphemes()
    Enum.all?(?a..?z, & <<&1::utf8>> in graphemes)
  end
end
