defmodule Client do
  use WebSockex

  alias ExTwitchPomobot.{CommandParser, CommandHandler}

  @bot_password System.get_env("BOT_PASSWORD")
  @bot_name System.get_env("BOT_NAME")
  @bot_channel System.get_env("BOT_CHANNEL")

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

  def handle_frame({type, message}, state) do
    IO.puts("Received Message - Type: #{inspect(type)} -- Message: #{inspect(message)}")

    message
    |> CommandParser.parse()
    |> CommandHandler.handle()

    {:ok, state}
  end
end
