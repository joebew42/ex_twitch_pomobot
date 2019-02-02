defmodule ExTwitchPomobot.PomodoroTimerTest do
  use ExUnit.Case

  import Mox

  alias ExTwitchPomobot.MockPomodoroStatus, as: PomodoroStatus
  alias ExTwitchPomobot.PomodoroTimer

  setup do
    start_supervised Mox.Server
    start_supervised PomodoroTimer

    :ok
  end
  setup :set_mox_global

  describe "when a new pomodoro starts" do
    test "it displays the information about the task" do
      expect(PomodoroStatus, :started_on, fn "a task name" -> :ok end)

      :ok = PomodoroTimer.start("a task name")

      verify!(PomodoroStatus)
    end
  end

  describe "when a pomodoro is running" do
    test "a new pomodoro cannot be started" do
      expect(PomodoroStatus, :started_on, 1, fn "a task name" -> :ok end)

      PomodoroTimer.start("a task name")
      PomodoroTimer.start("a task name")

      verify!(PomodoroStatus)
    end
  end
end
