#!/usr/bin/env bash

#CWD=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")
# shellcheck disable=SC2164
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck disable=SC1091
source "${CWD}/scripts/helpers.sh"
# shellcheck disable=SC1091
#source "${CWD}/scripts/playerctl_metadata.sh"

playerctl_player="#($CWD/scripts/playerctl_player.sh)"
playerctl_player_interpolation="\#{playerctl_player}"

playerctl_short="#($CWD/scripts/playerctl_short.sh)"
playerctl_short_interpolation="\#{playerctl_short}"

playerctl_track="#($CWD/scripts/playerctl_track.sh)"
playerctl_track_interpolation="\#{playerctl_track}"

playerctl_full="#($CWD/scripts/playerctl_full.sh)"
playerctl_full_interpolation="\#{playerctl_full}"

playerctl_title="#($CWD/scripts/playerctl_title.sh)"
playerctl_title_interpolation="\#{playerctl_title}"

playerctl_artist="#($CWD/scripts/playerctl_artist.sh)"
playerctl_artist_interpolation="\#{playerctl_artist}"

playerctl_album="#($CWD/scripts/playerctl_album.sh)"
playerctl_album_interpolation="\#{playerctl_album}"

playerctl_album="#($CWD/scripts/playerctl_emoji_status.sh)"
playerctl_album_interpolation="\#{playerctl_emoji_status}"

#interpolation=(
#	"\#playerctl_player}"
#	"\#playerctl_short}"
#	"\#playerctl_track}"
#	"\#playerctl_full}"
#	"\#playerctl_artist}"
#	"\#playerctl_album}"
#)
#int_commands=(
#	"#($CWD/scripts/playerctl_player.sh)"
#	"#($CWD/scripts/playerctl_short.sh)"
#	"#($CWD/scripts/playerctl_track.sh)"
#	"#($CWD/scripts/playerctl_full.sh)"
#	"#($CWD/scripts/playerctl_artist.sh)"
#	"#($CWD/scripts/playerctl_album.sh)"
#)

#do_interpolation() {
#  local all_interpolated="$1"
#  for ((i=0; i < ${#int_commands[@]}; i++)); do
#    all_interpolated=${all_interpolated//${interpolation[$i]}/${int_commands[$i]}}
#  done
#  echo "$all_interpolated"
#}

do_interpolation() {
  local string=$1
  local string=${string/$playerctl_player_interpolation/$playerctl_player}
  local string=${string/$playerctl_short_interpolation/$playerctl_short}
  local string=${string/$playerctl_track_interpolation/$playerctl_track}
  local string=${string/$playerctl_full_interpolation/$playerctl_full}
  local string=${string/$playerctl_title_interpolation/$playerctl_title}
  local string=${string/$playerctl_artist_interpolation/$playerctl_artist}
  local string=${string/$playerctl_album_interpolation/$playerctl_album}
  local string=${string/$playerctl_emoji_status_interpolation/$playerctl_album}
  echo "$string"
}

update_tmux_option() {
  local option option_value new_option_value
  option="$1"
  option_value="$(get_tmux_option "$option")"
  new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
#  tmux set-option -gq "$option" "$new_option_value"
}

main() {
#  do_interpolation
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
