defmodule Lasagna do
  @total_minutes_in_oven 40
  @minutes_per_layer 2

  def expected_minutes_in_oven() do
    @total_minutes_in_oven
  end

  def remaining_minutes_in_oven(minutes_in_oven) do
    expected_minutes_in_oven() - minutes_in_oven
  end

  def preparation_time_in_minutes(layers) do
    @minutes_per_layer * layers
  end

  def total_time_in_minutes(layers, minutes_in_oven) do
    preparation_time_in_minutes(layers) + minutes_in_oven
  end

  def alarm(), do: "Ding!"
end
