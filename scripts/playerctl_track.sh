#!/usr/bin/env bash

get_track() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} metadata --format "{{ track }}"
}

get_track
