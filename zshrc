# Aliases
source ~/.zshconfig/aliases

# Themes & Plugins

source ~/.antigen.zsh
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
[[ ! -f ~/.zshconfig/p10k.zsh ]] || source ~/.zshconfig/p10k.zsh

