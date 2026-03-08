# Scripts Directory

Build automation scripts for lib32-gtk4.

## Scripts

### `build-all.sh`
Build all packages in dependency order.

```bash
./scripts/build-all.sh              # Build to repo/
./scripts/build-all.sh -o ./output  # Build to custom directory
```

### `clean.sh`
Clean build artifacts (pkg/ and src/ directories).

```bash
./scripts/clean.sh
```

### `detect-features.sh`
Generate FEATURES.md from PKGBUILD files. Run automatically by CI.

```bash
./scripts/detect-features.sh
```

## Configuration

### `dependencies.conf`
Package build order and metadata. Format:
```
name|version|depends|aur_url|build_options|notes
```

### `common.sh`
Shared functions used by other scripts.

## Dependencies

- bash, pacman, makepkg
- base-devel, multilib-devel
- meson, ninja, cmake, pkgconf
