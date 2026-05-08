#!/usr/bin/env bash
set -euo pipefail

zshrc="$HOME/.zshrc"
touch "$zshrc"

add_to_path() {
  local dir="$1"
  local marker="$2"

  if [[ ! -d "$dir" ]]; then
    echo "Missing $dir — skipping"
    return
  fi

  if grep -Fq "$marker" "$zshrc"; then
    echo "$dir is already configured in $zshrc"
    return
  fi

  cat >> "$zshrc" <<EOF

$marker
if [ -d "$dir" ]; then
  case ":\$PATH:" in
    *":$dir:"*) ;;
    *) export PATH="$dir:\$PATH" ;;
  esac
fi
EOF
  echo "Added $dir to PATH in $zshrc"
}

add_to_path "$HOME/bin"               "# Add ~/bin to PATH"
add_to_path "$HOME/Developer/dotfiles/brew"  "# Add ~/Developer/dotfiles/brew to PATH"

echo "Restart your terminal or run: source ~/.zshrc"
