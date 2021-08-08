#!/usr/bin/env bash
#
#Takes the fonts in the .dotfiles and install to ~/.local/share/fonts/. Fonts
#here were downloaded for free from various sources.
#
#Does not work with non-zip files.

echo "* Installing Fonts"

cd ../
DIR=$(pwd)
echo "${DIR}"

[[ -d ~/.local/share/fonts ]] || mkdir -p ~/.local/share/fonts
#unzip -u $DIR/fonts/helveticaneue.zip -d ~/.local/share/fonts/

function unzip_d () {
    echo "** unzipping ${1}"
    mkdir -p ~/.local/share/fonts/"$1"
    unzip -vu $DIR/fonts/"$1" -d ~/.local/share/fonts/"$1".zip
}

#DO NOT ADD ZIP AT END OF FILE.
unzip_d helveticaneue
unzip_d Libre_Baskerville
