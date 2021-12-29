#!/usr/bin/env bash

get_active_player() {
  playerctl -l |head -n 1
}

get_active_player
