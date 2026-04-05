if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

export ZSH=$HOME/.oh-my-zsh

if [ ! -d ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
fi

ZSH_THEME="eastwood"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
RPROMPT='%*'
