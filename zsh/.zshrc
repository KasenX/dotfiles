# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_FIXTERM=false

source "$ZSH/oh-my-zsh.sh"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_VERIFY

# Options
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# Editor
if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# Tools
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

command -v sccache >/dev/null 2>&1 && export RUSTC_WRAPPER="sccache"

command -v nvim >/dev/null 2>&1 && alias vim="nvim"
command -v eza >/dev/null 2>&1 && alias ls="eza --group-directories-first"
command -v bat >/dev/null 2>&1 && alias cat="bat --paging=never --plain"
command -v kubecolor >/dev/null 2>&1 && alias k="kubecolor"

# PATH
typeset -U path PATH

path=(
  "$HOME/.opencode/bin"
  "/opt/homebrew/opt/curl/bin"
  "/Library/Frameworks/GStreamer.framework/Versions/1.0/bin"
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  "$HOME/bin"
  "$HOME/go/bin"
  $path
  "$HOME/.local/bin"
)

export PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# GStreamer
export PKG_CONFIG_PATH="/Library/Frameworks/GStreamer.framework/Versions/1.0/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
export DYLD_FALLBACK_LIBRARY_PATH="/Library/Frameworks/GStreamer.framework/Versions/1.0/lib${DYLD_FALLBACK_LIBRARY_PATH:+:$DYLD_FALLBACK_LIBRARY_PATH}"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
