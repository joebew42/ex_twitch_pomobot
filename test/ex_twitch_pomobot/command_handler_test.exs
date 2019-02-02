defmodule ExTwitchPomobot.CommandHandlerTest do
  use ExUnit.Case

  import Mox

  alias ExTwitchPomobot.MockTimer, as: Timer

  alias ExTwitchPomobot.CommandHandler
  alias ExTwitchPomobot.Commands

  setup :set_mox_global
  setup do
    start_supervised CommandHandler

    :ok
  end

  test "do nothing on undefined command" do
    assert nil == CommandHandler.handle(%Commands.Undefined{})
  end

  test "start a pomodoro with a task name" do
    expect(Timer, :start, fn "A task name" -> :ok end)

    command = %Commands.StartPomodoro{task_name: "A task name"}

    CommandHandler.handle(command)

    verify_expectation(Timer)
  end

  # TODO consider to move this in the test_helper
  defp verify_expectation(mock, times \\ 3, error \\ nil)
  defp verify_expectation(_mock, 0, error), do: raise error
  defp verify_expectation(mock, times, _error) do
    try do
      verify!(mock)
    rescue
      error ->
        Process.sleep(100)
        verify_expectation(mock, times - 1, error)
    end
  end
end
