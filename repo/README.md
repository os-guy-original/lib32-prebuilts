# lib32-gtk4-custom Repository

## Installation

Add the repository to your system:

```bash
# Add to /etc/pacman.conf:
[lib32-gtk4-custom]
Server = https://raw.githubusercontent.com/os-guy-original/lib32-gtk4-custom-prebuilt/main/repo
```

Refresh and install:

```bash
sudo pacman -Sy
sudo pacman -S lib32-gtk4
```

## Manual Installation

Download packages from the [Releases](https://github.com/os-guy-original/lib32-gtk4-custom-prebuilt/releases) page:

```bash
sudo pacman -U lib32-gtk4-*.pkg.tar.zst
```

## Updating the Repository Database

Run from the project root:

```bash
./repo/update-repo.sh
```

This creates `lib32-gtk4-custom.db.tar.gz` from packages in `releases/`.
