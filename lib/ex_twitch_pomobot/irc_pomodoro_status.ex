defmodule ExTwitchPomobot.IRCPomodoroStatus do
  @behaviour ExTwitchPomobot.PomodoroStatus

  alias ExTwitchPomobot.IRCTwitchChat, as: Chat

  @impl ExTwitchPomobot.PomodoroStatus
  def started_on(task_name) do
    Chat.write("""
    A pomodoro is started on this task \"#{task_name}\".
    If you want to ask a question related to this task,
    please use the command !pomo_ask followed by your question.
    At the end of the pomodoro, all the questions will show up!
    """)

    :ok
  end
end
