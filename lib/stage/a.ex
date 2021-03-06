defmodule Stage.A do
  use GenStage

  @name __MODULE__

  def child_spec(opts \\ []) do
    %{id: @name, start: {@name, :start_link, [opts]}}
  end

  def start_link(number) do
    GenStage.start_link(@name, number)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If the counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set the state to 5.
    events = Enum.to_list(counter..(counter + demand - 1))
    {:noreply, events, counter + demand}
  end
end
