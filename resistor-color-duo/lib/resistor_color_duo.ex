defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([first, second | _]) do
    color_value(first) * 10 + color_value(second)
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
