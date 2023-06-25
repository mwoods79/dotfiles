###
# PATH
###

# Homebrew path for M1 macs
if test -d /opt/homebrew/bin
	fish_add_path /opt/homebrew/bin
	fish_add_path /opt/homebrew/sbin
end

# dotfile executables
if test -d ~/.bin
	fish_add_path ~/.bin
end

# Stack executables
if test -d ~/.local/bin
	fish_add_path ~/.local/bin
end

###
# ALIAS
###

# use NeoVim by default
alias vim="nvim"
alias e="nvim"

# set some alias for git
alias gap='git add -p'
alias gnap='git add -N --ignore-removal . && gap && gref'
alias glp='git log -p'
alias glg='git log --graph --oneline --decorate --color --all'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcl='git clean -f -d'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glod='git log --oneline --decorate'
alias gp='git push'
alias gpr='git pull --rebase'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gco='git checkout'

###
# SETTINGS
###

set -gx EDITOR 'nvim'
set -gx PSQL_EDITOR 'nvim -c"setf sql"'
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git"'

###
# INITIALIZE
###

starship init fish | source

source (brew --prefix)/opt/asdf/libexec/asdf.fish

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# nim setup
if test -d ~/.nimble/bin
	fish_add_path ~/.nimble/bin
end

# rust setup
if test -d ~/.cargo/bin
	fish_add_path ~/.cargo/bin
end

direnv hook fish | source

source /Users/micah/.docker/init-fish.sh || true # Added by Docker Desktop
