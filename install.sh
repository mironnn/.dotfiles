#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NORMAL='\033[0m'
YELLOW='\033[0;33m'
SCRIPTPATH=`pwd -P`

docker=false
sudo_var="sudo"

for arg in "$@"
do
    if [ "$arg" = "docker" ] ; then
      docker=true
      sudo_var=""
      printf "${CYAN}Installation started inside DOCKER\n${NORMAL}"
    fi
done

if [ "$docker" = false ] ; then
  printf "${CYAN}Installation started\n${NORMAL}"
fi

function get_os_and_version(){
 
  if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=${NAME%% *}
    VER=$VERSION_ID
  elif type lsb_release >/dev/null 2>&1; then
      # linuxbase.org
      OS=$(lsb_release -si)
      VER=$(lsb_release -sr)
  elif [ -f /etc/lsb-release ]; then
      # For some versions of Debian/Ubuntu without lsb_release command
      . /etc/lsb-release
      OS=$DISTRIB_ID
      VER=$DISTRIB_RELEASE
  elif [ -f /etc/debian_version ]; then
      # Older Debian/Ubuntu/etc.
      OS=Debian
      VER=$(cat /etc/debian_version)
  elif [ -f /etc/SuSe-release ]; then
      # Older SuSE/etc.
      ...
  elif [ -f /etc/redhat-release ]; then
      # Older Red Hat, CentOS, etc.
      ...
  else
      # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
      OS=$(uname -s)
      VER=$(uname -r)
  fi
}

get_os_and_version

printf "OS: ${OS} ${VER}"


if [ "${OS}" = 'Debian' ]; then
  printf "\nPlatform Debian\n"
  source install/debian.sh
elif [ "${OS}" = 'Ubuntu' ]; then
  printf "\nPlatform Ubuntu\n"
  source install/ubuntu.sh
elif [ "$(uname)" = 'Darwin' ]; then
  printf "\nPlatform Darwin\n"
  source install/macos.sh
fi
