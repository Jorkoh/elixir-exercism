defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([f, s, t | _]) do
    raw = (color_value(f) * 10 + color_value(s)) * (10 ** color_value(t))
    cond do
      raw >= 1_000_000_000 ->
        {div(raw, 1_000_000_000), :gigaohms}
      raw >= 1_000_000 ->
        {div(raw, 1_000_000), :megaohms}
      raw >= 1_000 ->
        {div(raw, 1_000), :kiloohms}
      true ->
        {raw, :ohms}
    end
  end

  @spec color_value(atom) :: integer()
  def color_value(color) do
    case color do
      :black ->
        0
      :brown ->
        1
      :red ->
        2
      :orange ->
        3
      :yellow ->
        4
      :green ->
        5
      :blue ->
        6
      :violet ->
        7
      :grey ->
        8
      :white ->
        9
    end
  end
end
