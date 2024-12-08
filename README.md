
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
cd dotfiles
```

Then use GNU stow to create the symlinks.

```bash
stow .
```

More information about GNU stow can be found [here](https://www.gnu.org/software/stow/).
And a **video** explanation about how to use it can be found [here](https://www.youtube.com/watch?v=y6XCebnB9gs).

