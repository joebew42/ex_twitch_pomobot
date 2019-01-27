defmodule ExTwitchPomobot.PomodoroStatus do
  @callback started_on(String.t()) :: :ok
end
