#!/usr/bin/env bash
#CMUS: playerctl --ignore-player=${IGNOREPLAYERCTL} -p cmus metadata --format "{{playerName}} {{emoji(status)}} {{duration(position)}}/{{duration(mpris:length)}} - {{artist}} - {{album}} - {{title}}"
#CHROMIUM: playerctl --ignore-player=${IGNOREPLAYERCTL} -p ${IGNOREPLAYERCTL} metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{title}}"
#SPOTIFY: playerctl --ignore-player=${IGNOREPLAYERCTL} -p spotify metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{album}} - {{title}}"

main() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} metadata --format "{{emoji(status)}}"
}

main
