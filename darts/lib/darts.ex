defmodule Darts do
  @radious_outer 10
  @radious_middle 5
  @radious_inner 1

  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
    distance = calculate_distance(position)
    cond do
      distance > @radious_outer ->
        0
      distance > @radious_middle ->
        1
      distance > @radious_inner ->
        5
      true ->
        10
    end
  end

  @spec score(position) :: float
  defp calculate_distance({x, y}) do
    (x ** 2 + y ** 2) ** 0.5
  end
end
