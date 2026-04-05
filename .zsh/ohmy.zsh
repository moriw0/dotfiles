if [ ! -d $HOME/.oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"
plugins=(git)
source $ZSH/oh-my-zsh.sh
