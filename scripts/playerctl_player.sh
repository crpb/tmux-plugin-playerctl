#!/usr/bin/env bash

get_active_player() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} -l |head -n 1
}

get_active_player
