defmodule Stage.Application do
  @moduledoc false

  use Application

  @name __MODULE__

  @impl true
  def start(_type, _args) do
    Supervisor.start_link(@name, :ok)
  end

  def init(:ok) do
    children = [
      Stage.Fetch,
      Stage.Handle
      # {Stage.A, [5]},
      # Stage.B
      # Stage.C
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
