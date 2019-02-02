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
  def init(_args) do
    {:ok, false}
  end

  @impl true
  def handle_call({:start, _task_name}, _from, true) do
    {:reply, :ok, true}
  end

  @impl true
  def handle_call({:start, task_name}, _from, false) do
    @pomodoro_status.started_on(task_name)

    {:reply, :ok, true}
  end
end
