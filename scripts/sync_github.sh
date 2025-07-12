#!/bin/bash

echo "🔄 GitHub同期開始..."

CHANGES=$(git status --porcelain | wc -l)
if [ $CHANGES -eq 0 ]; then
    echo "📭 同期する変更がありません"
    exit 0
fi

echo "📝 同期する変更:"
git status --short

COMMIT_MSG="Workspace sync: $(date +"%Y/%m/%d %H:%M")"
git add .
git commit -m "$COMMIT_MSG"

git push origin main

echo "✅ GitHub同期完了"
echo "📱 GitHub Mobileで確認可能"
