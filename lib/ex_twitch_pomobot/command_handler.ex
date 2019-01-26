defmodule ExTwitchPomobot.CommandHandler do
  alias ExTwitchPomobot.Pomodoro
  alias ExTwitchPomobot.Commands

  def handle(%Commands.StartPomodoro{} = command) do
    IO.puts("Handling command: #{inspect(command)}")
    Pomodoro.start(command.task_name)
  end

  def handle(%Commands.Undefined{}), do: nil
end