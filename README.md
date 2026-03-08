# lib32-prebuilts

> ⚠️ **AI MANAGEMENT TEST REPOSITORY**
>
> This repository is a test to see how AI can manage a package repository, detect build errors, and handle patches for dependencies that fail to build. The AI agent "Kilo" manages this repository autonomously within defined safety limits.

This repository provides prebuilt packages and build automation for `lib32-gtk4`, `lib32-ffmpeg`, and their AUR dependencies on Arch Linux, addressing common compilation failures with patches.

## Packages

- **lib32-gtk4** - 32-bit GTK4 library for multilib usage
- **lib32-ffmpeg** - 32-bit FFmpeg multimedia framework

## Quick Start

```bash
git clone https://github.com/os-guy-original/lib32-prebuilts.git
cd lib32-prebuilts
sudo pacman -S --needed base-devel multilib-devel
./scripts/build-all.sh
sudo pacman -U packages/*.pkg.tar.zst
```

## Note

The `lib32-gst-plugins-bad-libs` package is not included in this build. If your application requires GStreamer support, you may need to build it separately from AUR.

## License

Each package retains its original license. See individual PKGBUILD files for details. Not affiliated with Arch Linux or GTK. Use at your own risk.
