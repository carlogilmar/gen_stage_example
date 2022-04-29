defmodule Wordle.Producer do
  use GenStage

  def start_link(_opts) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_state), do: {:producer, :ok}

  def handle_demand(demand, _state) do
    IO.puts("PRODUCER GENERATING #{demand} WORDS")
    events = 1..demand |> Enum.map(fn _ -> random_world() end)
    {:noreply, events, :ok}
  end

  defp random_world do
    1..5
    |> Enum.to_list()
    |> Enum.map(fn _ -> Enum.random(?a..?z) end)
    |> :erlang.list_to_binary()
  end
end
