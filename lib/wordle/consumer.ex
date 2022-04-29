defmodule Wordle.Consumer do
  use GenStage

  def start_link(_initial) do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(state) do
    {:consumer, :the_state_does_not_matter,
     subscribe_to: [{Wordle.ProducerConsumer, max_demand: 10}]}
  end

  def handle_events(events, _from, state) do
    IO.puts("CONSUMER GETTING EVENTS")

    for event <- events do
      Process.sleep(1000)
      IO.inspect(event, label: "EVENT")
    end

    {:noreply, [], state}
  end
end
