defmodule ExTwitchPomobot.CommandParser do
  alias ExTwitchPomobot.Commands

  def parse(irc_message) do
    ~r/:(?<user>\S+)!\S+ PRIVMSG #\S+ :!(?<command>\S+) (?<message>[^\\\r]+)/
    |> Regex.named_captures(irc_message)
    |> to_command()
  end

  defp to_command(%{"user" => user, "command" => "pomo_start", "message" => message}) do
    %Commands.StartPomodoro{user: user, task_name: message}
  end

  defp to_command(_) do
    %Commands.Undefined{}
  end
end
