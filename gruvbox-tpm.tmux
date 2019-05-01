#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEME_OPTION="@gruvbox-theme"
DEFAULT_THEME="dark"

get_theme() {
	local option="$1"
	local default_value="$2"
	local option_value
  option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		print "$default_value"
	else
		print "$option_value"
	fi
}

main() {
	local theme
  theme=$(get_theme "$THEME_OPTION" "$DEFAULT_THEME")
	tmux source-file "$CURRENT_DIR/tmux-gruvbox-${theme}.conf"
}
main
