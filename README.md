# ExTwitchPomobot

The first and only one Twitch Bot that brings the power of the Pomodoro Technique while you are at streaming.

Everything is started because of doing [Live Coding on Twitch](https://github.com/joebew42/twitch/issues/45)

# Run the TwitchBot

```
export BOT_PASSWORD=oauth:<OAUTH_TOKEN_HERE>
export BOT_NAME=<YOUR_BOT_NAME>
export BOT_CHANNEL=<YOUR_CHANNEL>

$ iex -S mix

iex(2)> alias ExTwitchPomobot.IRCTwitchChat, as: Client
iex(2)> {:ok, pid} = Client.start
{:ok, #PID<0.184.0>}

Client.write(pid, "hello from elixir")
```

_To generate an oauth token you can use [Twitch Chat OAuth Password Generator](https://twitchapps.com/tmi/)_.

# Useful resources

- [Chatbots & IRC Guide](https://dev.twitch.tv/docs/irc/guide/)

# Scratchpad

## DOING

- As a streamer I can start a new pomodoro with a task name
  - the command should be `!pomo_start [task name]`
  - [BUG] At the moment the `CommandHandler.handle()` is blocking. This cause a timeout when trying to write messages to the chat, through the `IRCTwitchChat`
  - We may have two options:
    - Make the CommandHandler a GenServer and handle all the commands as cast (non-blocking)
    - OR, provide to connection to the Twitch Chat: one for reading, and one for writing

## TODO

- As a viewer I can see how much time is left before the short break
  - the command `!pomo` will show the current task name and how much time left
- As a viewer I can ask a question related to the current pomodoro
  - the command `!pomo_ask [my question for streamer here ...]` will add a question
- As soon as the pomodoro is over, all the related questions will appear in the chat
- [?] Do we need to parse the IRC message? Or we can deal with the command only?
- [?] Should the CommandParser.parse have to return a `Undefined` command where unable to parse?
  - Should the `Undefined` command be part of `Commands`? I don't think so ...

## DONE