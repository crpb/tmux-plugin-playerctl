#!/usr/bin/env bash

get_active_player() {
  playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" -l |head -n 1 |sed 's/\..*//g'
}

get_active_player
