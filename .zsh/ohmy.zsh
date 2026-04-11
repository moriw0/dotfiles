if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

export ZSH=$HOME/.oh-my-zsh

if [ ! -d ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-$ZSH/custom}/plugins/you-should-use ]; then
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/you-should-use
fi

ZSH_THEME="eastwood"
plugins=(git aliases aws copyfile copypath docker docker-compose zsh-syntax-highlighting zsh-autosuggestions you-should-use)
source $ZSH/oh-my-zsh.sh
