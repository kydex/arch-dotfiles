HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt correct
setopt autocd

bindkey "^[[1;5A" history-beginning-search-backward

autoload -Uz compinit && compinit

alias ls='eza --icons always'
alias v='nvim'
# alias nvim='nvim --clean --cmd "set notermguicolors"'

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(starship init zsh)"
