#!/bin/bash
# dy_profile.sh - 进入抖音个人主页（优化版）
# 用法: bash dy_profile.sh

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata/"
DIR="$HOME/.kun_agent"

# 记录原始状态
ORIG=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>/dev/null)

# 预热 OCR
{ tesseract --list-langs > /dev/null 2>&1; } &

# 导航到个人主页
osascript -e '
tell application "Safari"
    activate
    if exists front document then
        set URL of front document to "https://www.douyin.com"
    else
        make new document with properties {URL:"https://www.douyin.com"}
    end if
end tell
' 2>/dev/null
sleep 3; cliclick kp:esc 2>/dev/null; sleep 0.2

# 点击左侧"我的"
cliclick c:260,520
sleep 2; cliclick kp:esc 2>/dev/null; sleep 0.2
wait

# 截图个人主页
screencapture -x "$DIR/screenshots/dy_profile_$$.png" 2>/dev/null
tesseract "$DIR/screenshots/dy_profile_$$.png" "$DIR/ocr_output/dy_profile_$$" -l chi_sim+eng --psm 6 2>/dev/null
echo "=== 个人主页 ==="
cat "$DIR/ocr_output/dy_profile_$$.txt"
