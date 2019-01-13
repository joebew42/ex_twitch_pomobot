defmodule ExTwitchPomobot.TwitchIRC do
  use WebSockex

  def start() do
    {:ok, client} = WebSockex.start_link("wss://irc-ws.chat.twitch.tv:443", __MODULE__, [])
    WebSockex.send_frame(client, {:text, "PASS oauth:<oauth_token_here>"})
    WebSockex.send_frame(client, {:text, "NICK joebew42"})
    WebSockex.send_frame(client, {:text, "JOIN #joebew42"})

    {:ok, client}
  end

  def write(client, message) do
    WebSockex.send_frame(client, {:text, "PRIVMSG #joebew42 :#{message}"})
  end

  def handle_frame({type, msg}, state) do
    IO.puts "Received Message - Type: #{inspect type} -- Message: #{inspect msg}"
    {:ok, state}
  end
end