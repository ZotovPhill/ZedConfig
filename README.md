# Zed Config

This repository provides a set of configuration files and snippets for the [Zed editor](https://zed.dev/). It includes:

- Keybindings (`keymap.json`)
- Editor and UI settings (`settings.json`)
- Python snippets (`snippets/python.json`)
- Custom tasks (`tasks.json`)
- A setup script (`setup.sh`) to help install and configure Zed, Lazygit, and Lazydocker

Use this configuration to streamline your workflow in Zed and take advantage of specialized features for Python development, Git, and Docker.

---

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Prerequisites](#prerequisites)
4. [Installation](#installation)
5. [Configuration](#configuration)
6. [Usage](#usage)
7. [Snippets](#snippets)
8. [Tasks](#tasks)
9. [Contributing](#contributing)
10. [License](#license)
11. [Contact](#contact)

---

## Overview

This configuration aims to:

- Provide opinionated defaults for Zed, such as UI font sizes and theme settings
- Offer pre-bound key commands for quick Git and Docker commands using Lazygit and Lazydocker
- Supply Python snippets that speed up coding tasks
- Include a script to automate the setup of Zed, Lazygit, and Lazydocker on Linux or macOS

---

## Features

- Keybindings in `keymap.json` for toggling the file finder (Shift Shift), calling Lazygit (Cmd-Alt-G), and Lazydocker (Cmd-Alt-D)
- Configurable Python language settings with type checking (Pyright), error linting (Ruff), and formatting
- Tasks to quickly launch Lazygit or Lazydocker from within Zed
- Python snippet collection for common coding patterns and boilerplate (e.g., if/else, class definitions, main block, etc.)
- Setup script (`setup.sh`) that:
  - Installs Zed
  - Installs Lazygit and Lazydocker (on Linux or macOS)
  - Clones or updates the `zed-config` repository to your local system
  - Copies all config files to your personal Zed config directory

---

## Prerequisites

- [Git](https://git-scm.com/) to clone the repository
- [Zed Editor](https://zed.dev/) account (an invite may be required, check the website for availability)
- A macOS or Linux machine (for the included setup script)
- [Homebrew](https://brew.sh/) on macOS if you want the script to install Zed, Lazygit, and Lazydocker automatically
- On Linux distributions, the script uses apt-based commands for installing Lazygit

---

## Installation

1. Clone this repository anywhere on your local machine. By default, the setup script will copy files into `~/.config/zed`:

   ```sh
   git clone https://github.com/user/zed-config.git
   ```

2. (Optional) Adjust the environment variables at the top of `setup.sh` if you want to customize the Zed config directory or the local checkout path:

   - `ZED_CONFIG_REPO_URL`
   - `ZED_CONFIG_DIR`
   - `LOCAL_ZED_CONFIG_DIR`

3. Run the setup script:

   ```sh
   cd zed-config
   bash setup.sh
   ```

   The script attempts to:

   - Detect your OS (Linux or macOS).
   - Install Zed via Homebrew on macOS or the official script on Linux.
   - Install or update Lazygit and Lazydocker.
   - Clone or pull the latest `zed-config` files.
   - Copy the configuration files to your Zed config folder.
   - Update keybindings for Linux (changing `cmd` to `ctrl` if on Linux).

4. Launch Zed to confirm everything is set up correctly.

---

## Configuration

All customization files are located in the `zed-config/` directory:

- `keymap.json`: Defines Zed keyboard shortcuts.
- `settings.json`: Sets up themes, autosave behaviors, fonts, code inlay hints, and integration with Python tools.
- `tasks.json`: Provides tasks for quickly launching Git and Docker tools.
- `snippets/python.json`: Python snippet definitions.

Feel free to edit these files to match your personal workflow.

---

## Usage

- Open Zed.
- Use the configured shortcuts:
  - Shift Shift to open the file finder.
  - Cmd-Alt-G (macOS) or Ctrl-Alt-G (Linux) to open Lazygit in the relevant repository.
  - Cmd-Alt-D (macOS) or Ctrl-Alt-D (Linux) to open Lazydocker.
- Python users benefit from type checking and linting—and from the built-in snippet expansions.
- Explore tasks (`Cmd/Ctrl+p → type “Run Task”`) to launch `start lazygit` or `start lazydocker`.

---

## Snippets

The `python.json` file under `snippets/` contains helpful expansions such as:

- If/Else, For, While loops, and Try/Except blocks
- Function, class, decorator, and unit test templates
- Common data structures (list/dict comprehensions, named tuples, etc.)

Use these by typing their prefixes (e.g., `snifelse`, `snfor`, `snwhile`) followed by Tab or Enter to expand.

---

## Tasks

The `tasks.json` file adds shortcuts in Zed’s “Run Task” palette:

- `start lazygit`: Launches Lazygit in the relevant Git repository.
- `start lazydocker`: Launches Lazydocker.

You can extend `tasks.json` with additional tasks (e.g., building or testing your code).

---

## Contributing

1. Fork the repository or create a branch.
2. Make your changes and commit them.
3. Push your branch to your fork.
4. Open a Pull Request.

Please open an issue for any improvements or bug fixes.

---

## License

Unless otherwise indicated, this project is licensed under the MIT License. You can adjust this to your preference or remove this section if the project is not open source.

---

## Contact

If you have questions or suggestions, please open an issue in the GitHub repository. Happy coding with Zed!
