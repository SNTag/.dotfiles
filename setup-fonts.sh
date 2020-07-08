#!/usr/bin/env bash

## Takes the fonts in the .dotfiles and install to ~/.local/share/fonts/

echo "Fonts =========================================="

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

[[ -d ~/.local/share/fonts ]] || mkdir -p ~/.local/share/fonts
unzip -u $DIR/fonts/helveticaneue.zip -d ~/.local/share/fonts/
