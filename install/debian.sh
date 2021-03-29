#!/bin/bash
printf "${CYAN}Apt-get updating...${NORMAL}\n"
apt -qq udpate
apt install -y software-properties-common
# add-apt-repository ppa:neovim-ppa/unstable
# apt -qq update
printf "${GREEN}DONE!${NORMAL}\n"


printf "${CYAN}Install apps from apt...${NORMAL}\n"
apt -qqy install python
apt -qqy install python3
apt -qqy install exuberant-ctags
apt -qqy install vim
apt -qqy install tmux
apt -qqy install cmake

apt -qqy install software-properties-common
apt -qqy install python-software-properties
apt -qqy install python-dev
apt -qqy install python-pip
apt -qqy install python3-dev
apt -qqy install python3-pip
apt -qqy install silversearcher-ag

apt -qqy install curl
apt -qqy install xclip
# apt -qqy install zsh
apt -qqy install git-extras
pip3 install --upgrade neovim

pip3 install pynvim

# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
# cd -

touch /etc/apt/apt.conf.d/99defaultrelease && echo "APT::Default-Release "stable";" > /etc/apt/apt.conf.d/99defaultrelease
cp ${SCRIPTPATH}/src/stable.list ${SCRIPTPATH}/src/testing.list /etc/apt/sources.list.d/

apt update
apt -qqy -t testing install neovim
pip3 install -U setuptools
pip3 install -U pynvim


curl -sLf https://spacevim.org/install.sh | bash


cd ${SCRIPTPATH}
cp -R ./src/SpaceVim.d/ ~/.SpaceVim.d/

printf "${GREEN}DONE!${NORMAL}\n"
