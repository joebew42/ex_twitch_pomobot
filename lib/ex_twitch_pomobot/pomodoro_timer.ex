defmodule ExTwitchPomobot.PomodoroTimer do
  @behaviour ExTwitchPomobot.Timer

  use GenServer

  @pomodoro_status Application.get_env(:ex_twitch_pomobot, :pomodoro_status)

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: :pomodoro_timer)
  end

  @impl ExTwitchPomobot.Timer
  def start(task_name) do
    GenServer.call(:pomodoro_timer, {:start, task_name})
  end

  @impl true
  def init(args) do
    {:ok, args}
  end

  @impl true
  def handle_call({:start, task_name}, _from, state) do
    IO.puts("Starting a new pomodoro for task: #{task_name}")
    @pomodoro_status.started_on(task_name)

    {:reply, :ok, state}
  end
end
