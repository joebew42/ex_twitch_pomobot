# ExTwitchPomobot

The first and only one Twitch Bot that brings the power of the Pomodoro Technique while you are at streaming.

Everything is started because of doing [Live Coding on Twitch](https://github.com/joebew42/twitch/issues/45)

# Run the TwitchBot

```
export BOT_PASSWORD=oauth:<OAUTH_TOKEN_HERE>
export BOT_NAME=<YOUR_BOT_NAME>
export BOT_CHANNEL=<YOUR_CHANNEL>

$ iex -S mix

iex(1)> {:ok, pid} = ExTwitchPomobot.TwitchIRC.start
{:ok, #PID<0.184.0>}

ExTwitchPomobot.TwitchIRC.write(pid, "hello from elixir")
```

_To generate an oauth token you can use [Twitch Chat OAuth Password Generator](https://twitchapps.com/tmi/).

# Useful resources

- [Chatbots & IRC Guide](https://dev.twitch.tv/docs/irc/guide/)

# Scratchpad

## DOING

- As a streamer I can start a new pomodoro with a task name
  - the command `!pomo_start [task name]`

## TODO

- As a viewer I can see how much time is left before the short break
  - the command `!pomo` will show the current task name and how much time left
- As a viewer I can ask a question related to the current pomodoro
  - the command `!pomo_ask [my question for streamer here ...]` will add a question
- As soon as the pomodoro is over, all the related questions will appear in the chat

## DONE