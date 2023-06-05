#!/usr/bin/env bash
#CMUS: playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" -p cmus metadata --format "{{playerName}} {{emoji(status)}} {{duration(position)}}/{{duration(mpris:length)}} - {{artist}} - {{album}} - {{title}}"
#CHROMIUM: playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" -p  metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{title}}"
#SPOTIFY: playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" -p spotify metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{album}} - {{title}}"

main() {
  playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" metadata --format "{{emoji(status)}}" |sed -e 's/\xef\xb8\x8f//g' -e 's/⏸/||/g'
}

main
