source ~/bin/antigen.zsh

antigen use oh-my-zsh # start

    # doesn't work for some reason. i am running the plugin manually now
    # antigen bundle fzf # keybindings (Ctrl+R, Alt+C, Ctrl+T) and completion - read README to configure it correctly

    antigen bundle hlissner/zsh-autopair # pairs brackets automatically
    antigen bundle zsh-users/zsh-autosuggestions # shows suggestions based on command history

    # talvez seja bom caso não queira usar o plugin fzf
    # antigen bundle atuinsh/atuin@main 

    if [ ! -f "/etc/wsl.conf" ]; then
        # too laggy on wsl 2 - https://github.com/zsh-users/zsh-syntax-highlighting/issues/790
        antigen bundle zsh-users/zsh-syntax-highlighting
    fi

antigen apply #end

# built-in ohmyzsh plugins
# necessary because many omz plugins misbehave on antigen
plugins=(
    # systemadmin # many useful aliases. maybe i should try this later
    # ufw
    # per-directory-history # try this later
    timer # adds a tiny timer to each command being executed
    vi-mode # VI IS LIFE
    thefuck # keybinding (ESC+ESC to correct previous command)
    python # aliases
    aliases # command als 
    # adb # completion (IS NOW BUILTIN IN ZSH)
    # fd # completion (apparently, ITS NOW BUILTIN IN ZSH too)
    docker # completion
    git # completion and MANY aliases
    gh # completion
    # zsh-interactive-cd # completion with fzf (not necessary)
    
    # ARCH: command-not-found só funciona se tiver pkgfile instalado e com databases
    command-not-found
    fzf 
)

# pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# completions
fpath=($XDG_CONFIG_HOME/zsh/completions $fpath)
autoload -U compinit
compinit

# Control + arrows
# bindkey ";5C" forward-word
# bindkey ";5D" backward-word
# doest work for some reason: bindkey '^H' backward-kill-word

bindkey '^[[A' fzf-history-widget

# making home and end keys work as they should
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

setopt autocd extendedglob
unsetopt beep

# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh"

source /usr/share/fzf/key-bindings.zsh

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
