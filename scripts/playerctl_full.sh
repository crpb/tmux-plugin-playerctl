#!/usr/bin/env bash

main() {
  playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" metadata --format "{{trunc(artist,30)}} - {{trunc(album,30)}} - {{trunc(title,50)}}"
}

main
