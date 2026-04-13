#!/bin/bash

CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")

if [ "$CURRENT" == "prefer-light" ] || [ "$CURRENT" == "default" ]; then
    echo "Switching to DARK theme (was $CURRENT)..."

    # Alacritty
    ln -sf ayu_mirage.toml ~/.config/alacritty/theme.toml

    # Waybar
    ln -sf colors-ayu-dark.css ~/.config/waybar/colors.css

    # Niri
    ln -sf ayu-dark.kdl ~/.config/niri/theme.kdl

    # Fuzzel
    ln -sf fuzzel-ayu-dark.ini ~/.config/fuzzel/fuzzel.ini

    # GTK / XDG Desktop Portal (GNOME Portal)
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    # gsettings set org.gnome.desktop.interface gtk-theme 'Ayu-Dark'

    notify-send "Theme Switched" "Dark mode activated" -i weather-clear-night
else
    echo "Switching to LIGHT theme (was $CURRENT)..."

    # Alacritty
    ln -sf ayu_light.toml ~/.config/alacritty/theme.toml

    # Waybar
    ln -sf colors-ayu.css ~/.config/waybar/colors.css

    # Niri
    ln -sf ayu-light.kdl ~/.config/niri/theme.kdl

    # Fuzzel
    ln -sf fuzzel-ayu-light.ini ~/.config/fuzzel/fuzzel.ini

    # GTK / XDG Desktop Portal
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    # gsettings set org.gnome.desktop.interface gtk-theme 'Ayu-Light'

    notify-send "Theme Switched" "Light mode activated" -i weather-clear
fi

# Waybar reload
pkill -SIGUSR2 waybar

# Alacritty reload
touch "$HOME/.config/alacritty/alacritty.toml"

