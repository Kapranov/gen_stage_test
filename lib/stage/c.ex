defmodule Stage.C do
  use GenStage

  @name __MODULE__

  def child_spec(opts \\ []) do
    %{id: @name, start: {@name, :start_link, [opts]}}
  end

  def start_link() do
    GenStage.start_link(@name, :ok)
  end

  def init(_) do
    {:consumer, :a_state_of_matter_or_a_matter_of_state}
  end

  def handle_events(events, _from, state) do
    Process.sleep(1000)
    IO.inspect(events)
    {:noreply, [], state}
  end
end
