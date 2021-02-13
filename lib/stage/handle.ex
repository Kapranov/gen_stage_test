defmodule Stage.Handle do
  use GenStage

  @name __MODULE__

  def child_spec(opts \\ []) do
    %{id: @name, start: {@name, :start_link, [opts]}}
  end

  def start_link(opts) do
    GenStage.start_link(@name, opts, name: @name)
  end

  def init(_) do
    IO.inspect("starting Handle")
    {:consumer, nil, subscribe_to: [{Stage.Fetch, max_demand: 1}]}
  end

  def handle_events(events, _from, state) do
    IO.inspect("handling #{inspect(events)}")
    {:noreply, [], state}
  end
end
