#!/bin/bash
printf "${CYAN}Apt-get updating...${NORMAL}\n"
export DEBIAN_FRONTEND=noninteractive
$sudo_var apt udpate
$sudo_var apt install -y software-properties-common
$sudo_var add-apt-repository -y ppa:neovim-ppa/unstable
$sudo_var apt -qq update
printf "${GREEN}DONE!${NORMAL}\n"


printf "${CYAN}Install apps from apt...${NORMAL}\n"
$sudo_var apt -qqy install python3 exuberant-ctags vim tmux cmake \
  python3-dev python3-pip \
  silversearcher-ag curl xclip git git-extras python3-testresources \
  python3-venv

# apt -qqy install python-software-properties
# apt -qqy install zsh
$sudo_var pip3 install --upgrade neovim

$sudo_var pip3 install pynvim

# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
# cd -


$sudo_var apt -qqy install neovim
$sudo_var pip3 install -U setuptools pynvim jedi


# nvim
cd
curl -sLf https://spacevim.org/install.sh | bash

cd ${SCRIPTPATH}
cp -R ./src/SpaceVim.d/ ~/.SpaceVim.d/

# tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf ~/
cd ${SCRIPTPATH}
cp ./src/tmux/.tmux.conf.local ~/
cd

printf "${GREEN}DONE!${NORMAL}\n"
