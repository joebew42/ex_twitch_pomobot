defmodule ExTwitchPomobot.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_twitch_pomobot,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ExTwitchPomobot.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:websockex, "~> 0.4.2"},
      {:mox, "~> 0.4.0", only: :test}
    ]
  end
end
