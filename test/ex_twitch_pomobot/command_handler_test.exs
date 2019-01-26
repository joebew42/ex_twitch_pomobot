defmodule ExTwitchPomobot.CommandHandlerTest do
  use ExUnit.Case, async: true

  import Mox

  alias ExTwitchPomobot.MockTimer

  alias ExTwitchPomobot.CommandHandler
  alias ExTwitchPomobot.Commands

  test "do nothing on undefined command" do
    assert nil == CommandHandler.handle(%Commands.Undefined{})
  end

  test "start a pomodoro with a task name" do
    expect(MockTimer, :start, fn "A task name" -> :ok end)

    command = %Commands.StartPomodoro{task_name: "A task name"}

    CommandHandler.handle(command)

    verify!(MockTimer)
  end
end
