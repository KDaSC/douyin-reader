# Douyin Reader - 抖音阅读器

> 🎯 无需 API Key，通过截屏 + OCR 读取抖音内容

<div align="center">

![macOS](https://img.shields.io/badge/macOS-14.0%2B-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Tesseract](https://img.shields.io/badge/OCR-Tesseract-orange)

</div>

一个轻量级 macOS Agent Skill，通过 **Safari + 截屏 + OCR** 与抖音网页版交互。搜索视频、提取字幕、点赞收藏，全都不用 API Key。

---

## 快速开始

```bash
# 1. 安装依赖
brew install tesseract tesseract-lang cliclick

# 2. 克隆到 Kun 的 skills 目录
git clone https://github.com/Kac/douyin-reader.git \
  ~/.kun/default_workspace/.agents/skills/douyin-reader

# 3. 搜索视频
bash scripts/dy_search.sh "美食"

# 4. 提取字幕
bash scripts/dy_transcribe.sh
```

---

## 功能

| 功能 | 说明 |
|:----|:-----|
| 🔍 **搜索** | 按关键词搜索抖音视频 |
| 📝 **字幕提取** | OCR 读取视频字幕 |
| 👍 **点赞/收藏** | 通过 Accessibility API 操作 |
| 🔄 **自动归位** | 完成后恢复原始应用 |

---

## 工作原理

```
用户请求 → Safari 打开抖音 → 截图 → OCR → 返回文字
```

通过 Safari 打开抖音网页版，截图目标区域，用 Tesseract OCR 提取文字返回。无需 API Key，无需逆向工程。

---

## 环境要求

| 要求 | 版本 |
|:----|:----|
| macOS | 14.0+ (Sonoma/Sequoia) |
| Safari | 任意现代版本 |
| [Tesseract](https://github.com/tesseract-ocr/tesseract) | 最新版 (通过 Homebrew) |
| [cliclick](https://github.com/BlueM/cliclick) | 最新版 (通过 Homebrew) |

---

## Agent 使用示例

| 你说 | Agent 执行 |
|:----|:-----------|
| "搜一下美食" | 打开 Safari → 抖音搜索 → 截图 → OCR → 返回结果 |
| "读一下这个视频的字幕" | 截图字幕区域 → OCR → 返回文字 |

---

## 已知限制

- ⏳ 抖音网页 SPA 加载可能较慢 — 截图会等待内容加载
- 🔍 OCR 准确率取决于视频画质和字体大小
- 🚫 不支持抖音 Mac 原生应用（Electron 框架与系统冲突）

---

## License

MIT © [Kac](https://github.com/Kac)
