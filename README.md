# fedora-update

Maintenance script to update/upgrade Fedora software packages and OS. Feel free to fork and tailor it according to your own needs.

## Features

- 📦 Supports flatpak and dnf package upgrades;
- 🗑️ Cleaning unnecessary/old packages, cache and files.

This script will not upgrade to a newer Fedora version. Use `sudo dnf system-upgrade` for this purpose.

## Running the script

```sh
chmod +x up.sh
./up.sh
```

## Credits

By Mike Margreve (mike.margreve@outlook.com) and licensed under MIT. The original source can be found here: https://github.com/margrevm/fedora-update
