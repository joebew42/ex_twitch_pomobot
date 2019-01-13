defmodule ExTwitchPomobot.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_twitch_pomobot,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ExTwitchPomobot.Application, []}
    ]
  end

  defp deps do
    [
      {:websockex, "~> 0.4.2"}
    ]
  end
end
