#!/usr/bin/env bash

get_track() {
  playerctl metadata --format "{{ track }}"
}

get_track
