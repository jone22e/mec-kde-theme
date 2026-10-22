#! /usr/bin/env bash

ROOT_UID=0

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
  ICONS_DIR="/usr/share/icons"
  APPS_DIR="/usr/local/share/applications"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
  KVANTUM_DIR="$HOME/.config/Kvantum"
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
  ICONS_DIR="$HOME/.local/share/icons"
  APPS_DIR="$HOME/.local/share/applications"
fi

SRC_DIR=$(cd $(dirname $0) && pwd)

THEME_NAME=WhiteSur
LATTE_DIR="$HOME/.config/latte"

uninstall() {
  local name=${1}

  [[ -d ${AURORAE_DIR}/${name} ]] && rm -rfv ${AURORAE_DIR}/${name}*
  [[ -d ${PLASMA_DIR}/${name} ]] && rm -rfv ${PLASMA_DIR}/${name}*
  [[ -f ${SCHEMES_DIR}/${name}.colors ]] && rm -rfv ${SCHEMES_DIR}/${name}*.colors
  [[ -d ${LOOKFEEL_DIR}/com.github.vinceliuice.${name} ]] && rm -rfv ${LOOKFEEL_DIR}/com.github.vinceliuice.${name}*
  [[ -d ${KVANTUM_DIR}/${name} ]] && rm -rfv ${KVANTUM_DIR}/${name}*
  [[ -d ${WALLPAPER_DIR}/${name} ]] && rm -rfv ${WALLPAPER_DIR}/${name}
  [[ -f ${LATTE_DIR}/${name}.layout.latte ]] && rm -rfv ${LATTE_DIR}/${name}.layout.latte
  [[ -f ${ICONS_DIR}/hicolor/symbolic/apps/whitesur-start-here-symbolic.svg ]] && rm -fv ${ICONS_DIR}/hicolor/symbolic/apps/whitesur-start-here-symbolic.svg
  [[ -f ${ICONS_DIR}/hicolor/scalable/apps/whitesur-launchpad.svg ]] && rm -fv ${ICONS_DIR}/hicolor/scalable/apps/whitesur-launchpad.svg
  [[ -f ${ICONS_DIR}/hicolor/scalable/apps/whitesur-terminal.svg ]] && rm -fv ${ICONS_DIR}/hicolor/scalable/apps/whitesur-terminal.svg
  grep -qs '^Icon=whitesur-terminal$' ${APPS_DIR}/org.kde.konsole.desktop && rm -fv ${APPS_DIR}/org.kde.konsole.desktop
}

echo "Uninstalling '${THEME_NAME} kde themes'..."

uninstall "${name:-${THEME_NAME}}"

echo "Uninstall finished..."
