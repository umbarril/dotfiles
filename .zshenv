export BARRIL_MODE=hyprland

export MANPAGER="nvim +Man!"

# export XDG_CURRENT_DESKTOP='dwm'

export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

# nvim is the best editor. fight me.
export EDITOR="nvim"

# export OPENER='dex'
export OPENER='xdg-open'
export READER='zathura'
export TERMINAL='kitty'
export VIDEO='mpv'
export COLORTERM='truecolor'
export IMAGE='feh'
export WINDOW_MANAGER='dwm'
export WM='dwm'
export PAGER='less'
export VISUAL='nvim'
export BROWSER='firefox'

# export FZF_DEFAULT_COMMAND=''
export FZF_BASE=/usr/bin/fzf

# taskd configuration
export TASKDDATA=/var/lib/taskd

# envs so java applications work properly on DWM
# if [[ $BARRIL_MODE = dwm ]]; then
#     export _JAVA_AWT_WM_NONREPARENTING=1
#     export AWT_TOOLKIT=MToolkit
#     export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
# fi

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
# export QT_STYLE_OVERRIDE=Adwaita-Dark
export QT_QPA_PLATFORMTHEME=qt6ct

# making cedilla work (portuguese speakers thank me later) 
# NOT NECESSARY WITH IBUS 
# export GTK_IM_MODULE=cedilla
# export QT_IM_MODULE=cedilla

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/usr/share/applications:$XDG_DATA_DIRS" # default
# flatpak
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$HOME/.local/share/applications:$XDG_DATA_DIRS"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Add all directories in `~/.local/bin` to $PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# bin
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/AppImages:$PATH"

# ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# cargo (rust)
export PATH="$HOME/.cargo/bin:$PATH"

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    path+=("$HOME/.local/bin")
fi

export PATH
