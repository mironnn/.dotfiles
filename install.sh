#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NORMAL='\033[0m'
YELLOW='\033[0;33m'
SCRIPTPATH=`pwd -P`


printf "${CYAN}Installation for started\n${NORMAL}"

if [ "$(uname)" = 'Linux' ]; then
  printf "Platform Linux\n"
  source install/linux.sh
elif [ "$(uname)" = 'Darwin' ]; then
  printf "Platform Darwin\n"
  source install/macos.sh
fi

