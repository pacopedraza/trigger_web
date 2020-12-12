#!/bin/bash
################################################################################
#                     Trigger and Search Web Content                           #
#                                                                              #
#                 Here are the tools that need to be installed                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################

setup_environment() {
    echo "Setting up environemt"
    python3 -m venv $ENVIRONMENT || { echo "Failed to create enrivonent!"; exit 1; }
    source $ENVIRONMENT/bin/activate || { echo "Failed to activate test env!" exit 2; }
    pip3 install -r $REQUIREMENTS || { echo "Failed to install requirements! " exit 3; }
    echo "Environment was setup successfully!"
}

download_driver() {
    echo "Downloading Driver..."
    if [[ $DISTRO == *"$LINUX"* ]]; then
        wget $CHROME87_LINUX || { echo "Failed to download chrome87 geko driver For Linux!"; exit 5; }
    elif [[ $DISTRO == *"$MACOS"* ]]; then
        wget $CHROME87_MACOS || { echo "Failed to download chrome87 geko driver for MacOS!"; exit 6; }
    fi
}

unzip_driver() {
    echo "Uncompressiong Driver..."
    if [[ $DISTRO == *"$LINUX"* ]]; then
        unzip $LINUX_ZIP || { echo "Failed to Uncompress file!"; exit 5; }
    elif [[ $DISTRO == *"$MACOS"* ]]; then
        unzip $MACOZ_ZIP || { echo "Failed to Uncompress file!"; exit 6; }
    fi
    
}


###
# Main
###

DISTRO=$(uname)
REQUIREMENTS="requirements.txt"
ENVIRONMENT="venv"

LINUX="Linux"
MACOS="Darwin"

CHROME87_LINUX="https://chromedriver.storage.googleapis.com/87.0.4280.88/chromedriver_linux64.zip"
CHROME87_MACOS="https://chromedriver.storage.googleapis.com/87.0.4280.88/chromedriver_mac64.zip"
#
LINUX_ZIP="chromedriver_linux64.zip"
MACOS_ZIP="chromedriver_mac64.zip"

setup_environment
download_driver
unzip_driver
