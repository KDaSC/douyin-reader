#!/bin/bash
# dy_search.sh v3 - 抖音搜索（极致优化版）
# 优化：缩短sleep、并行操作、批量OCR

QUERY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$1'))" 2>/dev/null)
[ -z "$QUERY" ] && echo "用法: dy_search.sh \"关键词\"" && exit 1

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata/"
DIR="$HOME/.kun_agent"

# 并行：后台准备好OCR环境，前台开Safari
{
    # 预热 tesseract（加载语言包，让后续更快）
    tesseract --list-langs > /dev/null 2>&1
} &

osascript -e "
tell application \"Safari\"
    activate
    if exists front document then
        set URL of front document to \"https://www.douyin.com/search/$QUERY\"
    else
        make new document with properties {URL:\"https://www.douyin.com/search/$QUERY\"}
    end if
end tell
" 2>/dev/null

# 等待页面加载 + 后台预热完成
wait
sleep 4

# ESC 清菜单
cliclick kp:esc 2>/dev/null

# 截图
IMG="$DIR/screenshots/dy_q_$$.png"
screencapture -x "$IMG" 2>/dev/null
tesseract "$IMG" "${IMG%.png}" -l chi_sim+eng --psm 6 2>/dev/null

if [ -f "${IMG%.png}.txt" ]; then
    echo "🔍 $1"
    echo "-------------------"
    cat "${IMG%.png}.txt"
fi

# 归位
osascript -e 'tell application "Safari" to close front document' 2>/dev/null
osascript -e 'tell application "System Events" to set frontmost of process "Kun" to true' 2>/dev/null
