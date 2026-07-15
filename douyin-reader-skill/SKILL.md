---
name: douyin-reader
description: 抖音内容读取与操作。支持搜索、查看字幕/文字、收藏、喜欢。用完自动归位。
---

# Douyin Reader - 抖音阅读器

通过 Safari 网页版 + OCR 识别来操作抖音。

## 前置条件

- macOS + Safari
- tesseract + 中文语言包
- cliclick

## 脚本

| 脚本 | 用途 | 用法 |
|:----|:-----|:-----|
| `scripts/dy_search.sh` | 搜索抖音 | `bash scripts/dy_search.sh "关键词"` |
| `scripts/dy_transcribe.sh` | 提取字幕 | `bash scripts/dy_transcribe.sh` |
| `scripts/dy_profile.sh` | 个人主页 | `bash scripts/dy_profile.sh` |

## 脚本说明

### dy_search.sh
通过 Safari 打开抖音搜索页，截图 + OCR 返回结果。

### dy_transcribe.sh
截图视频底部字幕区域，OCR 提取文字。

### dy_profile.sh
打开抖音个人主页，查看账号信息。

## 注意

- OCR 对抖音小字体识别有限，大段文字更准确
- 自动归位：用完切回调用方应用
