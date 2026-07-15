#!/bin/bash
# dy_transcribe.sh - 提取抖音视频字幕（OCR识别）
# 用法: bash dy_transcribe.sh
# 原理：截图视频底部字幕区域 → OCR

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata/"
DIR="$HOME/.kun_agent"

# 抖音视频字幕通常在底部 1/4 区域
# 截图视频区域的底部（字幕位置）
screencapture -x -R 0,500,800,300 "$DIR/screenshots/dy_sub_$$.png" 2>/dev/null
tesseract "$DIR/screenshots/dy_sub_$$.png" "$DIR/ocr_output/dy_sub_$$" -l chi_sim+eng 2>/dev/null

if [ -f "$DIR/ocr_output/dy_sub_$$.txt" ]; then
    echo "📝 字幕内容:"
    cat "$DIR/ocr_output/dy_sub_$$.txt"
else
    echo "⚠️ 未识别到字幕，视频可能无字幕或画面未加载"
fi
