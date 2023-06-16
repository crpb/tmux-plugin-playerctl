#!/usr/bin/env bash

main() {
  pvol="$(playerctl --ignore-player="$(printenv IGNOREPLAYERCTL)" \
    metadata --format "{{ volume * 100 }}"| cut -d. -f1 \
    | awk '{print "PV: "$1}')"
  if command -v wpctl >/dev/null; then
    gvol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ |perl -pe 's/[[:^digit:]]//g;s/^0//')"
  else
    gvol="$(pamixer --get-volume)%"
  fi
  printf "%s GV: %s" "$pvol" "$gvol"
}

main
