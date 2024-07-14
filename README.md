# dotbin

This repository contains a collection of scripts that I use daily to boost my productivity. Each script has a specific function to streamline and enhance my workflow.

## Scripts

### 1. Toggle Kitty

This script toggles the visibility of the Kitty terminal emulator, making it behave like a drop-down terminal.

- **Script:** `toggle-kitty.sh`
- **Description:** Shows or hides the Kitty terminal emulator with a single command.
- **Requirements:** Ensure you have `xdotool` installed (`sudo apt install -y xdotool`).

```bash
./toggle-kitty.sh
```

**Tip:** It's often more convenient to create a custom keyboard shortcut to run `toggle-kitty.sh`. On Ubuntu, follow these steps:

1. Open **Settings**.
2. Navigate to **Keyboard Shortcuts**.
3. Add a new custom shortcut and define your preferred keys (e.g., Meta + K or F12).
4. Set the command to the full path of `toggle-kitty.sh`.

### 2. Toggle Theme

This script switches the theme for both Kitty and Vim/Neovim between dark and light modes. It's useful for adapting your screen to different lighting conditions, such as moving from indoor to outdoor environments.

- **Script:** `toggle-theme.sh`
- **Description:** Switches the themes of Kitty and Vim/Neovim from dark to light or vice versa.
- **Configuration Paths:** 
  - Kitty: `$HOME/.config/kitty/kitty.conf`
  - Vim: `$HOME/.vim/init/scripts/theme.vim`

```bash
./toggle-theme.sh
```

**Tip:** Like the previous script, it's also advisable to map this command to keyboard shortcuts. 

### 3. Init TMUX

This script initializes a TMUX session with a predefined layout and windows to suit most of my development needs.

- **Script:** `init-tmux.sh`
- **Description:** Starts TMUX with a specific layout and window configuration.
- **Usage:**

```bash
./init-tmux.sh [session_name]
```

If no session name is provided, a default name with a timestamp will be used.

### 4. Dev Session

This script saves or restores the state of Kitty terminal emulator sessions, including tabs and working directories.

- **Script:** `dev-session.sh`
- **Description:** Saves or restores Kitty terminal tabs and their working directories.
- **Usage:**

```bash
./dev-session.sh save [session_name]
./dev-session.sh restore [session_name]
```

If no session name is provided, `kitty_state` will be used as the default name.

## Installation

Clone this repository and make the scripts executable:

```bash
git clone https://github.com/caesar003/dotbin
cd dotbin
chmod +x toggle-kitty.sh toggle-theme.sh init-tmux.sh dev-session.sh
```

## Usage

You can run each script directly from the command line as shown in the examples above.

**More Tips:**

1. Place the scripts in a directory such as `~/.bin` to keep them organized.
2. Add this directory to your `PATH` environment variable to run the scripts from anywhere in your system. Add the following line to your `~/.bashrc` or `~/.zshrc`:

   ```bash
   export PATH="$HOME/.bin:$PATH"
   ```

3. Reload your shell configuration:

   ```bash
   source ~/.bashrc  # or source ~/.zshrc for Zsh users
   ```

## License

This project is licensed under the MIT License.


