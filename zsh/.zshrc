# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ======================
# Basic Zsh Setup
# ======================

# Use modern completion system
autoload -Uz compinit
compinit

# History settings
HISTSIZE=5000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt share_history
setopt hist_ignore_space

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ======================
# Keychain (SSH/GPG agent)
# ======================
[ -r ~/.keychain/$HOSTNAME-sh ] && source ~/.keychain/$HOSTNAME-sh

# ======================
# Aliases
# ======================
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# ======================
# Prompt (simple + fast)
# ======================
# PROMPT='%F{cyan}%n%f@%F{yellow}%m%f:%F{green}%~%f %# '

# ======================
# Optional: Syntax highlighting
# ======================
# (git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ======================
# Optional: Autosuggestions
# ======================
# (git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ======================
# fzf integration
# ======================
# (install via pacman: pacman -S fzf)
# keybindings + completions
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi
if [[ -f /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# Example fzf alias
alias fh='history | fzf'  # fuzzy search history

# Yazi configuration
export EDITOR="nvim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init --cmd cd zsh)"
