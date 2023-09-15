defmodule PaintByNumber do
  def palette_bit_size(color_count), do: find_palette_bit_size(color_count, 0)

  defp find_palette_bit_size(color_count, palette_bit_size) do
    if 2 ** palette_bit_size >= color_count do
      palette_bit_size
    else
      find_palette_bit_size(color_count, palette_bit_size + 1)
    end
  end

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<index::size(bit_size), _rest::bitstring>> = picture
    index
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_index::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(a, b), do: <<a::bitstring, b::bitstring>>
end
