defmodule ExTwitchPomobot.PomodoroTimerTest do
  use ExUnit.Case, async: true

  import Mox

  alias ExTwitchPomobot.MockPomodoroStatus, as: PomodoroStatus
  alias ExTwitchPomobot.PomodoroTimer

  describe "when a new pomodoro starts" do
    test "it display the information about the task" do
      expect(PomodoroStatus, :started_on, fn "a task name" -> :ok end)

      :ok = PomodoroTimer.start("a task name")

      verify!(PomodoroStatus)
    end
  end
end
