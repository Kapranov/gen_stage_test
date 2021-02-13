defmodule Stage.B do
  use GenStage

  @name __MODULE__

  def child_spec(opts \\ []) do
    %{id: @name, start: {@name, :start_link, [opts]}}
  end

  def start_link(number) do
    GenStage.start_link(@name, number)
  end

  def init(number) do
    {:producer_consumer, number}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, &(&1 * number))
    {:noreply, events, number}
  end
end
