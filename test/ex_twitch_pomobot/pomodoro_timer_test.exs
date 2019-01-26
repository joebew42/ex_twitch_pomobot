defmodule ExTwitchPomobot.PomodoroTimerTest do
  use ExUnit.Case, async: true

  alias ExTwitchPomobot.PomodoroTimer

  test "starts a pomodoro for a specific task" do
    assert :ok == PomodoroTimer.start("a task name")
  end
end