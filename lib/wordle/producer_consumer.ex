defmodule Wordle.ProducerConsumer do
  use GenStage

  require Integer

  def start_link(_initial) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [{Wordle.Producer, max_demand: 10}]}
  end

  def handle_events(events, _from, state) do
    events_capitalized = Enum.map(events, &String.capitalize(&1))
    {:noreply, events_capitalized, state}
  end
end
