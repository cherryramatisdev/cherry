# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# ------------------------------ util functions ------------------------------
_have() { type "$1" &>/dev/null; }

# ------------------------------ my settings ------------------------------
# iterm2 show current cwd on tab bar
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
export EDITOR="nvi"
export GIT_EDITOR=$EDITOR
export PS1="🍒 "
export PROMPT_COMMAND=""
export SNIPPETS="$HOME/Repos/stowed/snippets"
export REVIEWERS="$(cat ~/reviewers | tr '\n' , | sed 's/,$//')"
export KEG_CURRENT=~/Repos/zet
if command -v pkg-config &>/dev/null; then
  export CGO_CFLAGS="$(pkg-config --cflags openssl)"
  export CGO_LDFLAGS="$(pkg-config --libs openssl)"
fi
# export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/openssl@3/lib/
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
#export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
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
export CDPATH=".:$REPOS:$WORK:$WORK/360hub:$HOME:$CONFIG"

# ------------------------ bash completion ------------------------
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
# pnpm end
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
alias depupdate='yarn upgrade-interactive --latest'
alias dotfiles='vi `fd . ~/Repos/grimoire | fzf`'
alias dr='docker run'
alias dsp='docker system prune -a'
alias e='exit'
alias en='emacsclient -nc -a '\'''\'''
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
alias l='eza'
alias la='eza -la'
alias lg='lazygit'
alias ll='eza -ll'
alias lowercase='tr '\''[:upper:]'\'' '\''[:lower:]'\'''
alias ls='eza'
alias o='git oneline'
alias oo='git oneline -10'
alias postgresup='docker run --rm --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e TZ=America/Sao_Paulo -d postgres'
alias t='tmux'
alias tmp='cd "$(mktemp -d /tmp/XXXXXX)"'
alias validate='yarn test && yarn build && yarn lint'
alias vi='$EDITOR'

set -o vi
