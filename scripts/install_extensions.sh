#!/bin/bash
echo "🔧 VS Code拡張機能インストール中..."

extensions=(
  "GitHub.vscode-pull-request-github"
  "ms-vscode.remote-repositories"
  "GitHub.copilot"
  "ms-vscode.vscode-json"
)

for ext in "${extensions[@]}"; do
  echo "Installing: $ext"
  code --install-extension "$ext"
done

echo "✅ 拡張機能インストール完了"
