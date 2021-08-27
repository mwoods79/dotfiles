alias v=nvim
alias vi=nvim
alias vim=nvim

export EDITOR='nvim'
export PSQL_EDITOR='nvim -c"setf sql"'

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
zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# Theme!
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose
