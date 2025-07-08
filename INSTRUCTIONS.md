# New Machine Setup Instructions

- Install Norman keyboard layout

- Install Homebrew:

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
