#!/usr/bin/env bash

main() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} metadata --format "{{ title }}"
}

main
