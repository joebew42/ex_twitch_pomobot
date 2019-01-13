defmodule ExTwitchPomobotTest do
  use ExUnit.Case
  doctest ExTwitchPomobot

  test "greets the world" do
    assert ExTwitchPomobot.hello() == :world
  end
end
