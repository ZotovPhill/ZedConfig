#!/bin/bash

# Define variables
ZED_CONFIG_REPO_URL="${1:-https://github.com/user/zed-config.git}"
ZED_CONFIG_DIR="${2:-$HOME/.config/zed}"
LOCAL_ZED_CONFIG_DIR="${3:-$HOME/projects/zed-config}"
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

# Clone or update Zed configuration repository
if [ -d "$LOCAL_ZED_CONFIG_DIR" ]; then
    echo "Zed configuration directory already exists. Pulling latest changes..."
    cd "$LOCAL_ZED_CONFIG_DIR"
    git pull origin master
else
    echo "Cloning Zed configuration repository..."
    git clone "$ZED_CONFIG_REPO_URL" "$LOCAL_ZED_CONFIG_DIR"
fi

# Ensure Zed config directory exists
mkdir -p "$ZED_CONFIG_DIR"

# Copy Zed configuration files
yes | cp -rf "$LOCAL_ZED_CONFIG_DIR"/configs/* "$ZED_CONFIG_DIR"

# Modify keymap.json based on OS
KEYMAP_FILE="$ZED_CONFIG_DIR/keymap.json"
if [[ "$OS" == "linux" ]]; then
    echo "Updating keymap for Linux..."
    sed -i 's/"cmd-Alt-/"ctrl-Alt-/g' "$KEYMAP_FILE"
elif [[ "$OS" == "mac" ]]; then
    echo "Using default macOS keymap."
fi

echo "Configuration updated successfully."

# If UPDATE_ONLY is set, skip tool installation
if [[ "$UPDATE_ONLY" == "true" ]]; then
    echo "Skipping tool installation as update-only mode is enabled."
    exit 0
fi

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
        sudo add-apt-repository ppa:lazygit-team/release -y
        sudo apt-get update
        sudo apt-get install lazygit -y
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

# Install tools
echo "Installing Zed Editor..."
install_zed
echo "Installing Lazygit..."
install_lazygit
echo "Installing Lazydocker..."
install_lazydocker

echo "Setup complete!"
