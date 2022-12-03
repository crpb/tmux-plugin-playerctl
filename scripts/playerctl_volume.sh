#!/usr/bin/env bash

main() {
  pvol="$(playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" \
    metadata --format "{{ volume * 100 }}"| cut -d. -f1 \
    | awk '{print "PV: "$1"%"}')"
  gvol="$(pamixer --get-volume)%"
  printf "%s / GV: %s" "$pvol" "$gvol"
}

main
