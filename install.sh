#!/bin/bash
echo "Requirements will be instaled …"
pip freeze > requirements.txt
pip install -r requirements.txt

if [[ ! -e $BREW ]]; then
    echo "Homebrew is not installed and will be installed first."
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
fi

if brew ls --versions tesseract > /dev/null; then
    echo "Tesseract is installed."
    echo "Homebrew is installed."
    echo "Root folder "$DIR/predictions/
    echo "Target folder "$DIR/results/
else
    if test ! $(which brew); then
      echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    echo "Updating homebrew..."
    brew doctor
    mkdir ~/Library/Caches/Homebrew

    echo "Installing leptonica..."
    brew install --with-libtiff --with-openjpeg --with-giflib leptonica

    echo "Installing ghostscript..."
    brew install gs
    brew install jq

    echo "Installing imagemagick..."
    brew install --with-libtiff --with-ghostscript imagemagick

    echo "Installing tesseract..."
    brew install --devel --all-languages tesseract
    brew install imagemagick
fi

exit 0
