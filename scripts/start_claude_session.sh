#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SESSION_LOG="claude_logs/session_$TIMESTAMP.log"

echo "🤖 Claude Code セッション開始"
echo "=================================="

cat > "$SESSION_LOG" << SESSION
Claude Code Session Log
Time: $(date)
Directory: $(pwd)
Git Branch: $(git branch --show-current)
Git Status: $(git status --porcelain | wc -l) changes

Session Activities:
SESSION

echo "📝 セッションログ: $SESSION_LOG"

git add .
git commit -m "Pre-Claude Code session: $TIMESTAMP" 2>/dev/null || echo "No changes to commit"

echo ""
echo "✅ 準備完了！Claude Codeを実行してください"
echo "💡 実行後は: ./scripts/end_claude_session.sh を実行"
echo ""
