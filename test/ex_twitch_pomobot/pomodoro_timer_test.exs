defmodule ExTwitchPomobot.PomodoroTimerTest do
  use ExUnit.Case

  import Mox

  alias ExTwitchPomobot.MockPomodoroStatus, as: PomodoroStatus
  alias ExTwitchPomobot.PomodoroTimer

  setup :set_mox_global
  setup do
    start_supervised PomodoroTimer

    :ok
  end

  describe "when a new pomodoro starts" do
    test "it displays the information about the task" do
      expect(PomodoroStatus, :started_on, fn "a task name" -> :ok end)

      :ok = PomodoroTimer.start("a task name")

      verify!(PomodoroStatus)
    end
  end

  # describe "when a pomodoro is running" do
  #   test "a new pomodoro cannot start" do
  #     expect(PomodoroStatus, :started_on, 0, fn "a task name" -> :ok end)

  #     :ok = PomodoroTimer.start("a task name")

  #     verify!(PomodoroStatus)
  #   end
  # end
end
