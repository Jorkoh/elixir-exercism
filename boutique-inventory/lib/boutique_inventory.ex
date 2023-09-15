defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1[:price], :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1[:price] == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, %{}, fn quantities ->
      Map.new(quantities, fn {key, value} -> {key, value + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, &(elem(&1, 1) + &2))
  end
end
