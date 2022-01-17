#!/usr/bin/env bash

main() {
  playerctl metadata --format "{{ volume * 100 }}"
}

main
