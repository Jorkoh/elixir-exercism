defmodule FreelancerRates do
  @hours_in_day 8.0
  @days_in_month 22.0

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_in_day
  end

  def apply_discount(before_discount, discount) do
    discount_pct = discount / 100
    before_discount - before_discount * discount_pct
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * @days_in_month
    apply_discount(monthly_rate, discount) |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = daily_rate(hourly_rate) |> apply_discount(discount)
    (budget / rate) |> Float.floor(1)
  end
end
