#!/bin/bash

# The version of Ubuntu to generate.  Successfully tested: focal, groovy
# See https://wiki.ubuntu.com/DevelopmentCodeNames for details
export TARGET_UBUNTU_VERSION="focal"

# The packaged version of the Linux kernel to install on target image.
# See https://wiki.ubuntu.com/Kernel/LTSEnablementStack for details
export TARGET_KERNEL_PACKAGE="linux-generic"

# The file (no extension) of the ISO containing the generated disk image,
# the volume id, and the hostname of the live environment are set from this name.
export TARGET_NAME="ubuntu-from-scratch"

# The text label shown in GRUB for booting into the live environment
export GRUB_LIVEBOOT_LABEL="Try Ubuntu FS without installing"

# The text label shown in GRUB for starting installation
export GRUB_INSTALL_LABEL="Install Ubuntu FS"

# Packages to be removed from the target system after installation completes succesfully
export TARGET_PACKAGE_REMOVE="
    ubiquity \
    casper \
    discover \
    laptop-detect \
    os-prober \
"

# Install 1Password for Linux (beta)
function install_1password() {
    # gpg key
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    # deb repo
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 beta main' | sudo tee /etc/apt/sources.list.d/1password.list
    # debsig-verify policy
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    # install
    apt update
    apt install -y 1password
}

# Install Brave
function install_brave() {
    # gpg key
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    # deb repo
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    # install
    apt update
    apt install -y brave-browser
}

# Install Microsoft Edge (beta)
function install_edge() {
    # gpg key
    curl -s https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    # deb repo
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
    # install
    apt update
    sudo apt install microsoft-edge-dev
}

# Install Google Chrome (beta)
function install_google_chrome() {
    # gpg key
    curl -s https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    # deb repo
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list
    #install
    apt update
    apt install -y google-chrome-stable
}

# Install b5x in Chrome (beta), Edge (stable), Firefox  (beta)
function install_b5x() {
    # chrome
    mkdir -p /opt/google/chrome/extensions
    echo '{"external_update_url":"https://clients2.google.com/service/update2/crx"}' | sudo tee /opt/google/chrome/extensions/khgocmkkpikpnmmkgmdnfckapcdkgfaf.json
    # edge
    mkdir -p /usr/share/microsoft-edge/extensions
    echo '{"external_update_url":"https://edge.microsoft.com/extensionwebstorebase/v1/crx"}' | sudo tee /usr/share/microsoft-edge/extensions/dppgmdbiimibapkepcbdbmkaabgiofem.json
    # firefox
    mkdir -p /usr/lib/firefox/distribution
    echo '{"policies":{"Extensions":{"Install":["https://s3.amazonaws.com/com.1password.b5x/firefox/beta/latest.xpi"]}}}' | sudo tee /usr/lib/firefox/distribution/policies.json
}

# Package customisation function.  Update this function to customize packages
# present on the installed system.
function customize_image() {
    # install graphics and desktop
    apt install -y \
        plymouth-theme-ubuntu-logo \
        ubuntu-gnome-desktop \
        ubuntu-gnome-wallpapers

    # useful tools
    apt install -y \
        clamav-daemon \
        terminator \
        apt-transport-https \
        software-properties-common \
        curl \
        vim \
        nano \
        less

    # install 1password
    install_1password

    # install browsers
    apt install -y firefox
    install_brave
    install_google_chrome
    install_b5x

    # purge
    apt purge -y \
        transmission-gtk \
        transmission-common \
        gnome-mahjongg \
        gnome-mines \
        gnome-sudoku \
        aisleriot \
        hitori
}

# Used to version the configuration.  If breaking changes occur, manual
# updates to this file from the default may be necessary.
export CONFIG_FILE_VERSION="0.3"
