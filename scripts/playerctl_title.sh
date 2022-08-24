#!/usr/bin/env bash

main() {
  playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" metadata --format "{{ title }}"
}

main
