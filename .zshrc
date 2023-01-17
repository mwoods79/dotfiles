alias v=nvim
alias vi=nvim
alias vim=nvim

export EDITOR='nvim'
export PSQL_EDITOR='nvim -c"setf sql"'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

# import local zsh customizations, if present
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

##############################################################################
# plugins
##############################################################################
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

# plugins
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# load starship prompt
eval "$(starship init zsh)"

# load asdf completions
source /usr/local/opt/asdf/libexec/asdf.sh

source /Users/micah/.docker/init-zsh.sh || true # Added by Docker Desktop
