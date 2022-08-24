#!/usr/bin/env bash

get_track() {
  playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" metadata --format "{{ track }}"
}

get_track
