# dotfiles
Linux configuration files by Nathaniel Evan. Inspired by various sources.

## Contains configurations for the following:
* `bspwm` (window manager), `betterlockscreen` (screen locker), `sxhkd` (hotkey daemon), `polybar` (status bar), `rofi` (menu)
* `rxvt-unicode` (terminal emulator)
* `zsh` (shell)
* `mpd` (music player daemon), `ncmpcpp` (player client)
* `spotifyd` (Spotify daemon)
* `ranger` (file manager)
* `neomutt`, `msmtp`, `isync`, `notmuch-runtime` (email client)
* `vim` (text editor)
* `tmux` (terminal multiplexer)
* `picom` (formerly compton, a display compositor)
* `xorg-xinit` (who needs a display manager?)
* `dunst` (notification daemon)
* `zathura` (pdf viewer)

## Dependencies:
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-syntax-highlighting), [powerlevel10k](https://github.com/romkatv/powerlevel10k)
* `nodejs` (for running coc.nvim), `ripgrep`, `bat` (for fzf.vim)
* `maim` (screenshot)
* `xss-lock` (for screen locking)
* `xorg-xbacklight` (screen brightness adjustment)
* `udiskie` (automounting USB drives)
* `pulseaudio` (sound server)
* Arc-Dark theme (`arc-gtk-theme` on Arch) (for GTK+ 2 and 3 applications)
* Iosevka Term font (`ttf-iosevka-term` on AUR)

## Notes
* These configuration files assume that the target system is running Arch Linux.
* Does not include system-wide configurations, e.g. systemd power management config (which I use in my machine)

## WIP:
* Personal bootstrapping script, if I ever feel like it.
* Finish configuring tmux.
* Experiment with awesomewm, ~~bspwm~~ and/or dwm/xmonad, when I'm in the mood to break things.

Suggestions and pull requests welcome, and if I accept yours, I'll credit you in this README and in the corresponding merge commit.

## Screenshot

TBD
