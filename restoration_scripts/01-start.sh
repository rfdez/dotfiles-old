#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

output::header "Executing custom install scripts"

# Avoid touching dotfiles while installing
export PREVIOUS_PROFILE="${PROFILE-}"
export PROFILE="/dev/null"
