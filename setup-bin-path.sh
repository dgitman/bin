#!/usr/bin/env bash
set -euo pipefail

bin_dir="$HOME/bin"
zshrc="$HOME/.zshrc"
marker="# Add ~/bin to PATH"

if [[ ! -d "$bin_dir" ]]; then
  echo "Missing $bin_dir"
  exit 1
fi

touch "$zshrc"

if grep -Fq "$marker" "$zshrc" || grep -Eq '(^|:|\")(\$HOME|~|/Users/dgitman)/bin(:|\"|$)' "$zshrc"; then
  echo "$bin_dir is already configured in $zshrc"
  exit 0
fi

cat >> "$zshrc" <<'EOF'

# Add ~/bin to PATH
if [ -d "$HOME/bin" ]; then
  case ":$PATH:" in
    *":$HOME/bin:"*) ;;
    *) export PATH="$HOME/bin:$PATH" ;;
  esac
fi
EOF

echo "Added $bin_dir to PATH in $zshrc"
echo "Restart your terminal or run: source ~/.zshrc"
