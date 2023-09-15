defmodule TakeANumber do
  def start() do
    spawn(&work/0)
  end

  defp work(state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        work(state)
      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        work(state + 1)
      :stop ->
        nil
      _ ->
        work(state)
    end
  end
end
