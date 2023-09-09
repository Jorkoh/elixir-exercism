defmodule GuessingGame do
  def compare(secret, guess \\ :no_guess)
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(secret, guess) when secret == guess, do: "Correct"
  def compare(secret, guess) when secret == guess + 1 or secret == guess - 1, do: "So close"
  def compare(secret, guess) when secret > guess, do: "Too low"
  def compare(secret, guess) when secret < guess, do: "Too high"
end
