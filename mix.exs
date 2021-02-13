defmodule GenStageTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :gen_stage_test,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Stage.Application, []}
    ]
  end

  defp deps do
    [
      {:gen_stage, "~> 1.1"}
    ]
  end
end
