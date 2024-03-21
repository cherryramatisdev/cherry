# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

# shopt -s checkwinsize
# shopt -s expand_aliases
# shopt -s globstar
# shopt -s dotglob
# shopt -s extglob

# ------------------------------ util functions ------------------------------
_have() { type "$1" &>/dev/null; }
rgr() { rg -0 -l "$1" | xargs -0 perl -pi.bak -e "s/$1/$2/g"; }
export -f rgr

# ------------------------------ my settings ------------------------------
export LSCOLORS=ExFxBxDxCxegedabagacad
# export PS1='[\w]\[\033[00m\] 🍒 '
export PS1='🍒 '
export CLICOLOR=1
export EDITOR="nvim"
_have delta && export PAGER="delta"
export GIT_EDITOR=$EDITOR
export SNIPPETS="$HOME/Repos/stowed/snippets"
export REVIEWERS="$(cat ~/reviewers | tr '\n' , | sed 's/,$//')"
if command -v pkg-config &>/dev/null; then
  export CGO_CFLAGS="$(pkg-config --cflags openssl)"
  export CGO_LDFLAGS="$(pkg-config --libs openssl)"
fi
export NODE_OPTIONS="--max-old-space-size=4096"
export XDG_CONFIG_HOME="$HOME/.config"
# This make the docker run correctly for arm
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# ------------------------------ setup languages/tools ------------------------------

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--bind ctrl-u:preview-up,ctrl-d:preview-down'

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
[[ -f "/Users/cherry/Scripts/fzf-git" ]] && source "/Users/cherry/Scripts/fzf-git"

# golang
export GOBIN="$HOME/go/bin"
export GOCACHE=$HOME/.cache/go-build
export PATH="$GOBIN:$PATH"

# dev.to
if [[ -f ~/devto ]]; then
  export DEVTO_API_KEY="$(cat ~/devto | tr '\n' , | sed 's/,$//')"
fi

# ------------------------------ config PATH ------------------------------
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/Library/pnpm:$PATH"
export PATH=$PATH:$HOME/.local/share/elixir-ls/
export PATH=$PATH:$HOME/.ghcup/bin
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:/Library/TeX/texbin/"
export PATH="$PATH:$HOME/.cargo/bin"

# Configure own installer scripts
[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

# ------------------------------ cdpath ------------------------------

export REPOS="$HOME/Repos"
export WORK="$HOME/Work"
export SCRIPTS="$HOME/Scripts"
export CONFIG="$HOME/.config"
export CDPATH=".:$REPOS:$WORK:$WORK/360Hub:$WORK/elleve:$HOME:$CONFIG"

# ------------------------ bash completion ------------------------
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[[ -r "/opt/homebrew/etc/bash_completion" ]] && . "/opt/homebrew/etc/bash_completion"
[[ -f "/etc/profiles/per-user/cherry/share/bash-completion/completions/pixie" ]] && . "/etc/profiles/per-user/cherry/share/bash-completion/completions/pixie"

_have gh && . <(gh completion -s bash)

complete -C vic vic
complete -C pkg pkg
complete -C a a

# pnpm
export PNPM_HOME="/Users/cherry/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -f "/Users/cherry/.ghcup/env" ] && source "/Users/cherry/.ghcup/env" # ghcup-env

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

alias b='bundle'
alias ba='bundle add'
alias be='bundle exec'
alias c='clear'
alias ca='cargo'
alias cat='bat'
alias chmox='chmod +x'
alias db='docker build'
alias dcd='docker-compose down'
alias dcu='docker-compose up'
alias dr='docker run'
alias dsp='docker system prune -a'
alias depupdate='yarn upgrade-interactive --latest'
alias dotfiles='vi `fd . ~/Repos/grimoire | fzf`'
alias e='exit'
alias fishies='asciiquarium'
alias ga='git a'
alias gc='~/Scripts/gc'
alias gci='git ci'
alias gco='git checkout'
alias gd='git diff'
alias gp='~/Scripts/gp'
alias gr='git rebase'
alias gre='git restore'
alias gres='git restore --staged'
alias gs='git show'
alias gst='git st'
alias gup='~/Scripts/gup'
alias jira='~/Scripts/jirarust'
alias ls='ls -GFhla'
alias tree='tree -I node_modules'
alias lowercase='tr '\''[:upper:]'\'' '\''[:lower:]'\'''
# alias ls='eza'
alias postgresup='docker run --rm --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e TZ=America/Sao_Paulo -d postgres'
alias t='tmux'
alias tmp='cd "$(mktemp -d /tmp/XXXXXX)"'
alias validate='yarn test && yarn build && yarn lint'
alias vi='$EDITOR'
alias ghome='cd "$(git rev-parse --show-toplevel)"'

set -o vi
