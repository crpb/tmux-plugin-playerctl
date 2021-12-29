#!/usr/bin/env bash
#CMUS: playerctl -p cmus metadata --format "{{playerName}} {{emoji(status)}} {{duration(position)}}/{{duration(mpris:length)}} - {{artist}} - {{album}} - {{title}}"
#CHROMIUM: playerctl -p chromium metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{title}}"
#SPOTIFY: playerctl -p spotify metadata --format "{{playerName}} {{emoji(status)}} - {{artist}} - {{album}} - {{title}}"

main() {
  playerctl metadata --format "{{emoji(status)}}"
}

main
