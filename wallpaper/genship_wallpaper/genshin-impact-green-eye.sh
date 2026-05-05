#!/bin/bash	

# ===== CONFIG =====
WALL="$1"
PROFILE_NAME="Genshin-Impact-Green-Eye"

# Get default profile UUID
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

BASE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/"

echo "Applying VoidPulse Theme to existing terminal profile..."

# =============================
# GNOME APPEARANCE
# =============================

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-olive-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru-olive-dark'
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


# TEXT & BACKGROUND
gsettings set $BASE background-color '#0A0F1C'      # deep space navy
gsettings set $BASE foreground-color '#EAF6FF'      # bright icy white
gsettings set $BASE bold-color '#FFFFFF'

gsettings set $BASE cursor-colors-set true
gsettings set $BASE cursor-background-color '#00E5FF'
gsettings set $BASE cursor-foreground-color '#0A0F1C'

gsettings set $BASE highlight-colors-set true
gsettings set $BASE highlight-background-color '#2A2F4F'
gsettings set $BASE highlight-foreground-color '#FFFFFF'

# =============================
# TRANSPARENCY (Subtle)
# =============================

gsettings set $BASE use-transparent-background true
gsettings set $BASE background-transparency-percent 8
gsettings set $BASE use-theme-transparency false

# =============================
# 16-COLOR PALETTE
# =============================

gsettings set $BASE palette "[
'#0A0F1C',
'#9A1F40',
'#2ED6A3',
'#7A5CFF',
'#1F6FEB',
'#9D4EDD',
'#00E5FF',
'#C9D6FF',
'#1C2333',
'#FF3D6E',
'#A811FC',
'#A78BFA',
'#4DA3FF',
'#C77DFF',
'#5DE4FF',
'#F8FAFF'
]"

echo "greenish theme applied successfully to the existing profile."
