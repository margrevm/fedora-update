#!/bin/sh

# Script to update packages from various sources and to upgrade Fedora OS
#
# Copyright (C) 2026 Mike Margreve (mike.margreve@outlook.com)
# Permission to copy and modify is granted under the foo license
#
# Usage: update [no arguments]

log_section() {
  printf "\n\033[1;34m[%s]\033[0m\n" "$1"
}

log_step() {
  printf "\033[0;34m➜ %s\033[0m\n" "$1"
}

# ---------------------------------------------------
# DNF package update
# ---------------------------------------------------
log_section "Updating dnf packages"

log_step "Refreshing repositories..."
sudo dnf check-update --refresh

log_step "Upgrading dnf packages to their latest version..."
sudo dnf upgrade -y

log_step "Removing unused dnf package dependencies..."
# ... packages that are not longer needed
sudo dnf autoremove -y

log_step "Cleaning package cache..."
# 'dnf clean all' removes cached packages and metadata.
sudo du -sh /var/cache/dnf # Shows the cache
sudo dnf clean all

# ---------------------------------------------------
# flatpak package update
# ---------------------------------------------------
if command -v flatpak >/dev/null 2>&1; then
    # If flatpak is installed...
    log_section "Updating flatpak packages"

    log_step "Upgrading flatpak packages to their latest version..."
    flatpak update

    log_step "Remove unused flatpak packages..."
    flatpak uninstall --unused
fi

# ---------------------------------------------------
# Other
# ---------------------------------------------------
#log_section "Updating other packages"

# Add other package managers or update commands here as needed
