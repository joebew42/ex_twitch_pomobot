defmodule ExTwitchPomobot.PomodoroTimer do
  @behaviour ExTwitchPomobot.Timer

  @impl ExTwitchPomobot.Timer
  def start(task_name) do
    IO.puts("Starting a new pomodoro for task: #{task_name}")
  end
end
