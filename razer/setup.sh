#!/bin/bash
set -eou pipefail
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Install the PPA. This is safe to do even if the PPA already was added previously.
echo "INFO: Adding openrazer ppa..."
sudo add-apt-repository ppa:openrazer/stable -y >/dev/null

# Install system deps.
echo "INFO: Installing razer apt deps..."
sudo apt-get -qq update
sudo apt-get -qq install -y \
	python3-pystray \
	software-properties-gtk

RAZER_BATTERY_TRAY_INSTALL_DIR="${HOME}/src/HoroTW/RazerBatteryTray"
RAZER_BATTERY_TRAY_PARENT_DIR="$(dirname "${RAZER_BATTERY_TRAY_INSTALL_DIR}")"
mkdir -p "${RAZER_BATTERY_TRAY_PARENT_DIR}"

if [[ ! -d "${RAZER_BATTERY_TRAY_INSTALL_DIR}" ]]; then
	echo "INFO: Cloning RazerBatteryTray..."
	git clone git@github.com:HoroTW/RazerBatteryTray.git "${RAZER_BATTERY_TRAY_INSTALL_DIR}"
fi

# On a fresh install, the autostart directory might not exist.
mkdir -p "${HOME}/.config/autostart"
if [[ -f "${HOME}/.config/autostart/razer_battery_tray.desktop" &&
	! -L "${HOME}/.config/autostart/razer_battery_tray.desktop" ]]; then
	echo "WARNING: ${HOME}/.config/autostart/razer_battery_tray.desktop already exists. Skipping..."
else
	if [[ ! -L "${HOME}/.config/autostart/razer_battery_tray.desktop" ]]; then
		echo "INFO: Creating symlink ${HOME}/.config/autostart/razer_battery_tray.desktop"
	fi
	# NOTE: This will overwrite any existing symlink.
	ln -sf "$dir/razer_battery_tray.desktop" "${HOME}/.config/autostart/razer_battery_tray.desktop"
fi
