#!/bin/bash
#
# This script is to launch the first time you sync with the repo or if you wish to change the location of your config files
# It will:
# - Ask for the location of your config files
# - Ask for the location of the target directory for the symbolic links
# - Create symbolic links for all files inside folders in the current directory to the configuration directory (default .config)
#  example: .config/nvim -> ~/config/nvim
# - Create symbolic links for files listed in HOME_FILES in the home directory to the target directory (default current directory)
#  example: .vimrc -> ~/config/.vimrc
#

CONFIG_DIR="$HOME/.config"                                          # Configuration directory for directories
HOME_FILES=(".vimrc" ".zpreztorc")                                  # List of files to link in the home directory
TARGET_DIR="$HOME/config"                                           # Target directory for the symbolic links
INCLUDE_DOTFILES="true"                                             # Include hidden files and directories by default
EXCLUDE_FOLDERS=("set_symbolic_links.sh" "Code" ".git" "README.md") # Add folders to exclude

read -p "Enter your configuration directory (default $CONFIG_DIR): " custom_config_dir
read -p "Enter the target directory for symbolic links (default $TARGET_DIR): " custom_target_dir

# Use custom values if provided
if [[ -n "$custom_config_dir" ]]; then
  CONFIG_DIR="$custom_config_dir"
fi

if [[ -n "$custom_target_dir" ]]; then
  TARGET_DIR="$custom_target_dir"
  mkdir -p "$TARGET_DIR"
fi

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s dotglob
shopt -s nullglob
array=(*)

# Function to create symbolic links
create_symlink() {
  local source=$1
  local target=$2

  # Check if the source exists, and ask for confirmation to overwrite
  if [[ -e "$target" ]]; then
    echo "A file or directory already exists at $target."
    read -p "Do you want to overwrite it with a symbolic link? (Y/n): " reply

    if [[ "$reply" != "y" && "$reply" != "Y" ]]; then
      echo "Skipping $source."
      return
    fi

    if [[ -d "$target" ]]; then
      rm -rf "$target"
    else
      rm "$target"
    fi
  fi

  echo "Creating symbolic link for $source."

  if [[ ! -e "$target" ]]; then
    echo "Creating directory $target"
    mkdir -p "$(dirname "$target")"
  fi

  ln -s "$source" "$target"
}

# Check if entry is in HOME_FILES, and if so, we return 0
is_home_file() {
  local file=$1
  for home_file in "${HOME_FILES[@]}"; do
    if [[ "$file" == "$home_file" ]]; then
      return 0
    fi
  done
  return 1
}

# Process regular files and directories in CONFIG_DIR
for entry in "${array[@]}"; do
  if [[ " ${EXCLUDE_FOLDERS[@]} " =~ " ${entry} " ]]; then
    echo "Skipping excluded folder: $entry."
    continue
  fi

  # Skip if the entry is a home file (e.g. .vimrc, .zpreztorc) using is_home_file()
  if is_home_file "$entry"; then
    echo "Skipping $entry for $CONFIG_DIR."
    continue
  fi

  create_symlink "$TARGET_DIR/$entry" "$CONFIG_DIR/$entry"
done

# Process special home directory files
for file in "${HOME_FILES[@]}"; do
  create_symlink "$TARGET_DIR/$file" "$HOME/$file"
done

# Disable dotglob if it was enabled
if [[ "$INCLUDE_DOTFILES" == "true" ]]; then
  shopt -u dotglob
fi

echo "Symbolic links have been created."
