#!/usr/bin/env bash

main() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} metadata --format "{{ volume * 100 }}"
}

main
