#!/bin/bash

# Define the file paths
KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"
VIM_CONFIG="$HOME/.vim/init/scripts/theme.vim"

# Define themes
KITTY_LIGHT_THEME="include themes/3024_Day.conf"
KITTY_DARK_THEME="include themes/3024_Night.conf"
VIM_LIGHT_THEME="colorscheme retrobox"
VIM_DARK_THEME="colorscheme twilight256"

# Determine current theme from Kitty config
if grep -q "$KITTY_LIGHT_THEME" "$KITTY_CONFIG"; then
    # Currently using light theme, switch to dark theme
    sed -i "s|$KITTY_LIGHT_THEME|$KITTY_DARK_THEME|" "$KITTY_CONFIG"
    sed -i "s|set background=light|set background=dark|" "$VIM_CONFIG"
    sed -i "s|$VIM_LIGHT_THEME|$VIM_DARK_THEME|" "$VIM_CONFIG"
    echo "Switched to dark theme."
else
    # Currently using dark theme, switch to light theme
    sed -i "s|$KITTY_DARK_THEME|$KITTY_LIGHT_THEME|" "$KITTY_CONFIG"
    sed -i "s|set background=dark|set background=light|" "$VIM_CONFIG"
    sed -i "s|$VIM_DARK_THEME|$VIM_LIGHT_THEME|" "$VIM_CONFIG"
    echo "Switched to light theme."
fi
