# Use directory colors from ~/.dir_colors
test -r ~/.config/dir_colors && eval $(dircolors ~/.config/dir_colors)

# Use Vim keybinds
bindkey -v
export KEYTIMEOUT=1

autoload -Uz colors
colors

setopt histignorealldups sharehistory
setopt prompt_subst

# Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*:descriptions' format "%2F%B--- %d%b%f"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "%1F%B--- No matches found%b%f"
zstyle ':completion:*:corrections' format '%3F%B--- %d%b%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|st*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Git information on prompt
autoload -Uz vcs_info
add-zsh-hook -Uz precmd vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' %1Fon branch%f %B%5F%b%u%c%f%%b'
zstyle ':vcs_info:git:*' actionformats ' %1Fon branch%f %B%5F%b|%a%u%c%f%%b'

# Expand aliases after sudo
alias sudo='sudo '

# Add colors to ls
alias ls='ls --color'

# Alias vim to nvim because I'm braindead
alias vim='nvim'
alias vimdiff='nvim -d'

# Clear history
alias ch='rm ~/.cache/zsh/history'

# Clear primary selection
alias clp='xclip -sel primary -i /dev/null'

# Clear clipboard selection
alias clc='xclip -sel clipboard -i /dev/null'

# Screen recording at 30fps without audio
alias screenrec='ffmpeg -framerate 30 -f x11grab -i :0.0 -pix_fmt yuv420p $HOME/screc-`date +%d%m%y-%H%M%S`.mp4'

# Record audio from microphone
alias micrec='ffmpeg -f pulse -i default -ac 1 $HOME/audio-`date +%d%m%y-%H%M%S`.m4a'

# Record screen with audio from mic
alias screenmicrec='ffmpeg -framerate 30 -f x11grab -i :0.0 -pix_fmt yuv420p -f pulse -i default -ac 1 $HOME/screc-`date +%d%m%y-%H%M%S`.mp4'

# Prompt config
if [[ $EUID -ne 0 ]]; then
#     PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%5F\$(git_info)%f%1F]%f%7F$%f %b"
    PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%1F]%f%7F$%f %b"
else
    PROMPT="%B%3F[%n@%m %1~]# %f%b"
fi

# Fancy features - comment out to speed up load time

## Load zsh-autosuggestions
# source $XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## Load zsh-syntax-highlighting
# source $XDG_DATA_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Refer to zsh-users/zsh-syntax-highlighting#510
# ZSH_HIGHLIGHT_STYLES[comment]='none'

## Load powerlevel10k
# source $XDG_DATA_HOME/zsh/plugins/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
