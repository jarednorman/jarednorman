# New Machine Setup Instructions

- Install Homebrew:

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install packages we like

  ```
  brew install neovim eza flyctl fnm fzf gh htop imagemagick luajit git pure rbenv tmux tree vips yarn
  ```

- Install casks we like

  ```
  brew install --cask firefox@developer-edition font-jetbrains-mono hiddenbar kitty 1password claude zed todoist-app obsidian linear-linear notion
  ```

- 

- Install dotfiles

  ```
  git clone git@github.com:jarednorman/jarednorman.git && cd jarednorman && ./install
  ```
