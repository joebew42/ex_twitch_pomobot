defmodule ExTwitchPomobot.CommandHandlerTest do
  use ExUnit.Case, async: true

  alias ExTwitchPomobot.CommandHandler
  alias ExTwitchPomobot.Commands

  test "do nothing on undefined command" do
    assert nil == CommandHandler.handle(%Commands.Undefined{})
  end
end