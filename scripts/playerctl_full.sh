#!/usr/bin/env bash

main() {
  playerctl --ignore-player=${IGNOREPLAYERCTL} metadata --format "{{ artist }} - {{ title }}"
}

main
