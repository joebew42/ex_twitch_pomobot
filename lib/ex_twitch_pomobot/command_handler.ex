defmodule ExTwitchPomobot.CommandHandler do
  alias ExTwitchPomobot.Commands

  @timer Application.get_env(:ex_twitch_pomobot, :timer)

  def handle(%Commands.StartPomodoro{} = command) do
    @timer.start(command.task_name)
  end

  def handle(%Commands.Undefined{}), do: nil
end
