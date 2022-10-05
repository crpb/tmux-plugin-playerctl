#!/usr/bin/env bash

main() {
  pvol="$(playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" \
    metadata --format "{{ volume * 100 }}"| cut -d. -f1 \
    | awk '{print "PV: "$1"%"}')"
  gvol="$(amixer -M get Master |grep -Po '\d{0,3}\%')"
  printf "%s / GV: %s" "$pvol" "$gvol"
}

main
