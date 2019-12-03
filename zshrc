### Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias ..='cd ..'
alias grep='grep --color=auto'
alias ports='netstat -an | grep LISTEN'
alias df='df -h'
alias cdh='cd $HOME'
alias cdo='cd /opt'
alias zrc='nano $HOME/.zshrc'
alias c='clear'
alias h='history'
alias top='htop'

## Themes & Plugins

source $HOME/.antigen.zsh
antigen bundle agkozak/zsh-z
antigen theme romkatv/powerlevel10k
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen apply
zstyle ':completion:*' menu select

### Settings fuer History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
