defmodule ExTwitchPomobot.TwitchIRC do
  use WebSockex

  @bot_password "oauth:<oauth_token_here>"
  @bot_name "joebew42"
  @bot_channel "joebew42"

  def start() do
    {:ok, client} = WebSockex.start_link("wss://irc-ws.chat.twitch.tv:443", __MODULE__, [])
    WebSockex.send_frame(client, {:text, "PASS #{@bot_password}"})
    WebSockex.send_frame(client, {:text, "NICK #{@bot_name}"})
    WebSockex.send_frame(client, {:text, "JOIN ##{@bot_channel}"})

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