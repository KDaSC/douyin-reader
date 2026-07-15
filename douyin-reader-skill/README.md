# Douyin Reader

> 🎯 macOS screen reader for Douyin/TikTok — no API key needed

<div align="center">

![macOS](https://img.shields.io/badge/macOS-14.0%2B-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Tesseract](https://img.shields.io/badge/OCR-Tesseract-orange)

</div>

A lightweight agent skill that reads Douyin (抖音) content through **screen capture + OCR**. Search videos, extract subtitles, and interact with the Douyin web interface — all without an API key.

---

## Quick Start

```bash
# 1. Install dependencies
brew install tesseract tesseract-lang cliclick

# 2. Clone to your Kun skills directory
git clone https://github.com/Kac/douyin-reader.git \
  ~/.kun/default_workspace/.agents/skills/douyin-reader

# 3. Search videos
bash scripts/dy_search.sh "美食"

# 4. Extract subtitles
bash scripts/dy_transcribe.sh
```

---

## Features

| Feature | Description |
|---------|-------------|
| 🔍 **Search** | Search Douyin videos by keyword |
| 📝 **Subtitle Extraction** | Read video subtitles via OCR |
| 👍 **Like & Favorite** | Click buttons via accessibility API |
| 🔄 **Auto Restore** | Returns to previous app after use |

---

## How It Works

```
User request → Safari opens douyin.com → Screenshot → OCR → Return text
```

The skill opens Douyin's web interface in Safari, captures the relevant screen area, runs OCR via Tesseract, and returns the extracted text. No API key, no reverse engineering.

---

## Requirements

| Requirement | Version |
|-------------|---------|
| macOS | 14.0+ (Sonoma/Sequoia) |
| Safari | Any modern version |
| [Tesseract](https://github.com/tesseract-ocr/tesseract) | Latest (via Homebrew) |
| [cliclick](https://github.com/BlueM/cliclick) | Latest (via Homebrew) |

---

## Agent Usage

| You Say | The Agent Does |
|---------|---------------|
| "Search Douyin for food" | Opens Safari → douyin.com → searches → screenshots → OCR → returns results |
| "Read the subtitles of this video" | Screenshots the subtitle area → OCR → returns text |

---

## Limitations

- ⏳ Douyin's web SPA may load slowly — screenshots wait for content
- 🔍 OCR accuracy depends on video quality and font size
- 🚫 Native Douyin app not supported (Electron framework conflicts on macOS)

---

## License

MIT © [Kac](https://github.com/Kac)
