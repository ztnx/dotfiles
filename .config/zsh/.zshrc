#!/bin/sh
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"

# (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
unsetopt BEEP                                     # DISABLE beep

stty stop undef                                   # DISABLE: ctrl-s freeze terminal
zle_highlight=('paste:none')                      # DISABLE: paste highlight

source "$ZDOTDIR/zsh_functions"
zsh_add_file "zsh-vim-mode"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

alias v="nvim"
alias vi="nvim"
alias l="exa -lah --icons --group-directories-first"
alias ls="exa --icons -a --group-directories-first"
alias f='zi'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'

# git related aliases
alias gc="git checkout" 
alias gp="git push"
alias gP="git pull"
alias ga="git add"
alias gcmsg="git commit -m"
alias m="git checkout main"

# work related aliases
alias dcu="docker-compose up"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias ddu="docker-compose down && docker-compose up"
alias cyo="npx cypress open"

# confirm before overwriting
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

alias psmem='ps auxf | sort -nr -k 4 | head -5' # get top process eating memory
alias pscpu='ps auxf | sort -nr -k 3 | head -5' # get top process eating cpu ##

export PATH=/User/ztnx/.local/share/nvim/lsp_servers/rust:$PATH
source /Users/ztnx/.config/broot/launcher/bash/br

# Autocompletions ( github.com/zsh-users/zsh-completions )
# zsh compinit: insecure directories... ( github.com/zsh-users/zsh-completions/issues/433#issuecomment-390600994 )
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
