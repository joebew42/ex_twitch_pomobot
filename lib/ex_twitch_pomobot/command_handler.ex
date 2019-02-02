defmodule ExTwitchPomobot.CommandHandler do
  use GenServer

  alias ExTwitchPomobot.Commands

  @timer Application.get_env(:ex_twitch_pomobot, :timer)

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: :command_handler)
  end

  def init(args) do
    {:ok, args}
  end

  def handle(%Commands.StartPomodoro{} = command) do
    GenServer.cast(:command_handler, command)
  end

  def handle(%Commands.Undefined{}), do: nil

  def handle_cast(%Commands.StartPomodoro{} = command, state) do
    @timer.start(command.task_name)

    {:noreply, state}
  end
end
