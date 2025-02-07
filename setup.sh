#!/bin/bash

# Define variables
ZED_CONFIG_REPO_URL="${1:-https://github.com/ZotovPhill/ZedConfig.git}"
ZED_CONFIG_DIR="${2:-$HOME/.config/zed}"
LOCAL_ZED_CONFIG_DIR="${3:-$HOME/PycharmProjects/ZedConfig}"
UPDATE_ONLY="${4:-false}"

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Linux*) OS="linux" ;;
        Darwin*) OS="mac" ;;
        *) OS="unsupported" ;;
    esac
    echo "Detected OS: $OS"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Zed Editor
install_zed() {
    if command_exists zed; then
        echo "Zed is already installed. Skipping installation."
        return
    fi
    if [[ "$OS" == "linux" ]]; then
        echo "Installing Zed for Linux..."
        curl -fsSL https://zed.dev/install.sh | bash
    elif [[ "$OS" == "mac" ]]; then
        echo "Installing Zed for macOS..."
        brew install --cask zed
    else
        echo "Unsupported OS for Zed installation"
    fi
}

# Function to install Lazygit
install_lazygit() {
    if command_exists lazygit; then
        echo "Lazygit is already installed. Skipping installation."
        return
    fi
    if [[ "$OS" == "linux" ]]; then
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit -D -t /usr/local/bin/
        rm lazygit.tar.gz lazygit
    elif [[ "$OS" == "mac" ]]; then
        brew install lazygit
    else
        echo "Unsupported OS for Lazygit installation"
    fi
}

# Function to install Lazydocker
install_lazydocker() {
    if command_exists lazydocker; then
        echo "Lazydocker is already installed. Skipping installation."
        return
    fi
    if [[ "$OS" == "linux" ]]; then
        curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    elif [[ "$OS" == "mac" ]]; then
        brew install lazydocker
    else
        echo "Unsupported OS for Lazydocker installation"
    fi
}

# Modify keymap.json based on OS
update_keymap() {
    KEYMAP_FILE="$ZED_CONFIG_DIR/keymap.json"
    if [[ "$OS" == "linux" ]]; then
        echo "Updating keymap for Linux..."
        sed -i 's/"cmd-/"win-/g' "$KEYMAP_FILE"
    elif [[ "$OS" == "mac" ]]; then
        echo "Using default macOS keymap."
    fi

    echo "Configuration updated successfully."
}

# Clone or update Zed configuration repository
clone_zed_config() {
    if [ -d "$LOCAL_ZED_CONFIG_DIR" ]; then
        echo "Zed configuration directory already exists. Pulling latest changes..."
        cd "$LOCAL_ZED_CONFIG_DIR"
        git pull origin main
    else
        echo "Cloning Zed configuration repository..."
        git clone "$ZED_CONFIG_REPO_URL" "$LOCAL_ZED_CONFIG_DIR"
    fi

    # Copy Zed configuration files
    yes | cp -rf "$LOCAL_ZED_CONFIG_DIR"/configs/* "$ZED_CONFIG_DIR"
}

echo "Setting up Zed Editor configuration..."
detect_os

# Ensure Zed config directory exists
mkdir -p "$ZED_CONFIG_DIR"

echo "Cloning or updating Zed configuration..."
clone_zed_config

echo "Updating keymap based on OS..."
update_keymap

# If UPDATE_ONLY is set, skip tool installation
if [[ "$UPDATE_ONLY" == "true" ]]; then
    echo "Skipping tool installation as update-only mode is enabled."
    exit 0
fi

# Install tools
echo "Installing Zed Editor..."
install_zed

echo "Installing Lazygit..."
install_lazygit

echo "Installing Lazydocker..."
install_lazydocker

echo "Setup complete!"
