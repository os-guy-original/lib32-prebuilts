# lib32-gtk4-custom Repository

## Installation

### 1. Add the repository

Add to `/etc/pacman.conf`:

```
[lib32-gtk4-custom]
Server = https://raw.githubusercontent.com/os-guy-original/lib32-gtk4-custom-prebuilt/main/repo
```

### 2. Import the GPG key (for package verification)

```bash
curl -sL https://raw.githubusercontent.com/os-guy-original/lib32-gtk4-custom-prebuilt/main/repo/lib32-gtk4-custom.pub | sudo pacman-key --add -
sudo pacman-key --lsign-key E4A5D5830B9BD51A
```

### 3. Install the package

```bash
sudo pacman -Sy
sudo pacman -S lib32-gtk4
```

## Manual Installation

Download packages directly from the repository:

```bash
sudo pacman -U https://raw.githubusercontent.com/os-guy-original/lib32-gtk4-custom-prebuilt/main/repo/lib32-gtk4-4.18.6-1-x86_64.pkg.tar.zst
```

## Updating the Repository Database

Run from the project root:

```bash
./repo/update-repo.sh
```

This creates `lib32-gtk4-custom.db` from packages in the current directory.
