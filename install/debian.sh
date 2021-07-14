#!/bin/bash
printf "${CYAN}Apt-get updating...${NORMAL}\n"

export DEBIAN_FRONTEND=noninteractive
$sudo_var apt -qq udpate
$sudo_var apt install -y software-properties-common
# add-apt-repository ppa:neovim-ppa/unstable
# apt -qq update
printf "${GREEN}DONE!${NORMAL}\n"


printf "${CYAN}Install apps from apt...${NORMAL}\n"
$sudo_var apt -qqy install python3 exuberant-ctags vim tmux cmake \
  python3-dev python3-pip software-properties-common \
  silversearcher-ag curl xclip \
  wget telnet git git-extras


# apt -qqy install zsh
$sudo_var pip3 install --upgrade neovim pynvim

# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
# cd -

$sudo_var touch /etc/apt/apt.conf.d/99defaultrelease && echo "APT::Default-Release "stable";" > /etc/apt/apt.conf.d/99defaultrelease
$sudo_var cp ${SCRIPTPATH}/src/stable.list ${SCRIPTPATH}/src/testing.list /etc/apt/sources.list.d/

$sudo_var apt update
$sudo_var apt -qqy -t testing install neovim
$sudo_var pip3 install -U setuptools pynvim
$sudo_var apt autoclean


curl -sLf https://spacevim.org/install.sh | bash


cd ${SCRIPTPATH}
cp -R ./src/SpaceVim.d/ ~/.SpaceVim.d/

printf "${GREEN}DONE!${NORMAL}\n"
