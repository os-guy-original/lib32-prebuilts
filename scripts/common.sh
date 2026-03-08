#!/bin/bash
# Common functions for build scripts

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

log_info() { echo -e "${BLUE}[INFO]${NC} $*"; }
log_error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
log_success() { echo -e "${GREEN}[OK]${NC} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
log_debug() { [[ "${DEBUG:-0}" == "1" ]] && echo -e "${BLUE}[DEBUG]${NC} $*"; }

check_multilib() {
    if pacman -Sl multilib &>/dev/null; then
        return 0
    fi
    log_error "Multilib repository not enabled"
    log_info "Add to /etc/pacman.conf:"
    log_info "  [multilib]"
    log_info "  Include = /etc/pacman.d/mirrorlist"
    return 1
}

get_pkg_name() {
    local pkgbuild="${1:-PKGBUILD}"
    grep -E "^pkgname=" "$pkgbuild" 2>/dev/null | cut -d'=' -f2 | tr -d "'\""
}
