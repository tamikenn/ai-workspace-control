#!/bin/bash

LATEST_LOG=$(ls -t claude_logs/session_*.log | head -1)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "🏁 Claude Code セッション終了"
echo "================================"

echo "" >> "$LATEST_LOG"
echo "Session End: $(date)" >> "$LATEST_LOG"
echo "Final Git Status: $(git status --porcelain | wc -l) changes" >> "$LATEST_LOG"

git add .
git commit -m "Post-Claude Code session: $TIMESTAMP"
git push origin main

echo "✅ セッション完了・GitHub同期済み"
echo "📱 GitHub Mobileで結果を確認できます"

./scripts/update_dashboard.sh
