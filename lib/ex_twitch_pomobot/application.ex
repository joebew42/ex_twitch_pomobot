defmodule ExTwitchPomobot.Application do
  use Application

  alias ExTwitchPomobot.CommandHandler

  def start(_type, _args) do
    children = [
      CommandHandler
    ]

    opts = [strategy: :one_for_one, name: ExTwitchPomobot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
