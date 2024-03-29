alias e=nvim
alias v=nvim
alias vi=nvim
alias vim=nvim

export EDITOR='nvim'
export PSQL_EDITOR='nvim -c"setf sql"'
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

# import local zsh customizations, if present
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

# load custom exectuables for user
if [[ -d ~/.bin ]];then
    export PATH=~/.bin:$PATH
fi

# load starship prompt
eval "$(starship init zsh)"

if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    # load asdf completions
    source "$(brew --prefix)/opt/asdf/libexec/asdf.sh"
fi


if [[ -d ~/.nimble/bin ]];then
    export PATH=~/.nimble/bin:$PATH
fi

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

zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# overrides gap from oh-my-zsh git
unalias gap
alias gap='git add -p'

eval "$(direnv hook zsh)"
