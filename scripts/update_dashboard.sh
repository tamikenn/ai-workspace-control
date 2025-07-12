#!/bin/bash

TOTAL_SESSIONS=$(ls claude_logs/session_*.log 2>/dev/null | wc -l)
RECENT_SESSIONS=$(ls -t claude_logs/session_*.log 2>/dev/null | head -3)
ACTIVE_PROJECTS=$(ls projects/ 2>/dev/null | wc -l)

cat > README.md << DASHBOARD
# 🤖 AI Workspace Control Center

**最終更新**: $(date)

## 📊 Current Status
- **アクティブプロジェクト**: $ACTIVE_PROJECTS
- **Claude Code セッション数**: $TOTAL_SESSIONS
- **最終Git同期**: $(git log -1 --pretty=format:'%h %s (%cr)' 2>/dev/null || echo "初回セットアップ")

## 🎯 Quick Start

### Claude Code実行
\`\`\`bash
./scripts/start_claude_session.sh
[ここでClaude Codeを実行]
./scripts/end_claude_session.sh
\`\`\`

### プロジェクト管理
\`\`\`bash
mkdir projects/PROJECT_NAME
cd projects/PROJECT_NAME
./scripts/sync_github.sh
\`\`\`

## 📝 Recent Claude Code Sessions
$(echo "$RECENT_SESSIONS" | sed 's|claude_logs/session_||g' | sed 's|\.log||g' | sed 's/^/- /' || echo "- まだセッションがありません")

## 🚀 System Commands

| コマンド | 説明 |
|---------|------|
| \`./scripts/start_claude_session.sh\` | Claude Codeセッション開始 |
| \`./scripts/end_claude_session.sh\` | Claude Codeセッション終了 |
| \`./scripts/sync_github.sh\` | 手動GitHub同期 |
| \`./scripts/update_dashboard.sh\` | ダッシュボード更新 |

## 📱 Mobile Access
- [GitHub Mobile](https://github.com/mobile) でリアルタイム監視
- Issues でタスク管理
- Actions で自動化確認

---
*AI Workspace - Powered by GitHub + VS Code + Claude*
DASHBOARD

echo "✅ ダッシュボード更新完了"
