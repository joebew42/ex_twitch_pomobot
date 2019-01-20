defmodule ExTwitchPomobot.CommandParserTest do
  use ExUnit.Case, async: true

  alias ExTwitchPomobot.Commands
  alias ExTwitchPomobot.CommandParser

  test "returns StartPomodoro command" do
    irc_message = ":a_user!a_user@a_user.tmi.twitch.tv PRIVMSG #channel :!pomo_start task name\r\n"

    command = CommandParser.parse(irc_message)

    assert command == %Commands.StartPomodoro{user: "a_user", task_name: "task name"}
  end

  describe "when unable to parse a message" do
    test "returns Undefined command" do
      command = CommandParser.parse("any messages that we cannot handle")

      assert command == %Commands.Undefined{}
    end
  end
end
