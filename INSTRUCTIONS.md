# New Machine Setup Instructions

- Install Norman keyboard layout

- Install Homebrew:

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install casks we like

  ```
  brew install --cask firefox@developer-edition font-jetbrains-mono hiddenbar kitty 1password claude zed todoist-app obsidian linear-linear notion tuple
  ```

- Generate SSH key and add to GitHub

- Install dotfiles

  ```
  git clone git@github.com:jarednorman/jarednorman.git && cd jarednorman && ./install
  ```

- Install packages we like

  ```
  brew bundle --global
  ```
