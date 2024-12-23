
# dotfiles

All my dotfiles!

## Dependencies

```bash
sudo pacman -S stow git
```

## Installation

First, clone the repo in your $HOME directory using git.

```bash
cd ~
git clone https://github.com/UmBarril/dotfles.git
```

Then use GNU stow to create the symlinks.

```bash
cd dotfiles
stow .
```

More information about GNU stow can be found [here](https://www.gnu.org/software/stow/).

Also a **video** explanation about how to use it can be found [here](https://www.youtube.com/watch?v=y6XCebnB9gs).

# Thanks

wlogout config was taken from [here](https://github.com/zDyanTB/HyprNova/blob/master/.config/wlogout)
