defmodule ExTwitchPomobot.CommandParser do

  alias ExTwitchPomobot.Commands

  def from(_irc_message) do
    %Commands.StartPomodoro{user: "joebew42", task_name: "something"}
  end
end