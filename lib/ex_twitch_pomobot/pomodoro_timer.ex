defmodule ExTwitchPomobot.PomodoroTimer do
  @behaviour ExTwitchPomobot.Timer

  @pomodoro_status Application.get_env(:ex_twitch_pomobot, :pomodoro_status)

  @impl ExTwitchPomobot.Timer
  def start(task_name) do
    IO.puts("Starting a new pomodoro for task: #{task_name}")
    @pomodoro_status.started_on(task_name)
  end
end
