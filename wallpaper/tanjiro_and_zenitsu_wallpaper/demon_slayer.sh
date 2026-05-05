#!/bin/bash

# ===== CONFIG =====
WALL="$1"
PROFILE_NAME="CrimsonVoid"

# Get default profile UUID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

BASE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/"

echo "Applying Crimson Void Theme to existing terminal profile..."

# =============================
# GNOME APPEARANCE
# =============================

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

# =============================
# WALLPAPER
# =============================

if [ -n "$WALL" ]; then
    gsettings set org.gnome.desktop.background picture-uri "file://$WALL"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALL"
fi


# =============================
# Terminal settings
# =============================

gsettings set $BASE visible-name "'$PROFILE_NAME'"
gsettings set $BASE use-theme-colors false
gsettings set $BASE bold-is-bright false

# =============================
# TEXT & BACKGROUND
# =============================

gsettings set $BASE background-color '#0D0F14'
gsettings set $BASE foreground-color '#F8FAFF'
gsettings set $BASE bold-color '#FFFFFF'

gsettings set $BASE cursor-colors-set true
gsettings set $BASE cursor-background-color '#FF2A2A'
gsettings set $BASE cursor-foreground-color '#0D0F14'

gsettings set $BASE highlight-colors-set true
gsettings set $BASE highlight-background-color '#B1121B'
gsettings set $BASE highlight-foreground-color '#FFFFFF'

# =============================
# TRANSPARENCY
# =============================

gsettings set $BASE use-transparent-background true
gsettings set $BASE background-transparency-percent 8
gsettings set $BASE use-theme-transparency false

# =============================
# 16 COLOR PALETTE
# =============================

gsettings set $BASE palette "[
'#0D0F14',
'#B1121B',
'#52F19C',
'#B8860B',
'#3D7ACF',
'#8A2BE2',
'#39D5CA',
'#C9CED6',
'#1C1F26',
'#FF2A2A',
'#53FFAC',
'#FFB703',
'#4DA3FF',
'#FF4D9D',
'#5DE4FF',
'#F5F7FA'
]"

echo "Crimson Void applied successfully to the existing profile."
