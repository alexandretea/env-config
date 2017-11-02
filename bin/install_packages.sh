# Text File

# Author:   Alexandre Tea <alexandre.qtea@gmail.com>
# File:     /Users/qwertea/Work/env-config/bin/install_packages
# Purpose:  TODO (a one-line explanation)
# Created:  2017-11-02 15:41:42
# Modified: 2017-11-02 15:56:58

PKG_MNG_CMD="brew install"

declare -a packages=(
    "wget"
    "htop"
    # gcc/g++ etc are downloaded with xCode on macOS
)

for pkg in "${packages[@]}"
do
    $PKG_MNG_CMD "$pkg"
done
