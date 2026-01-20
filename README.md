# Flutter Architecture & Dart Fundamentals

## 1. Flutter Architecture

Flutter has 3 layers:

| Layer | What it does |
|-------|-------------|
| **Framework** (Dart) | Widgets, animations, Material/Cupertino design |
| **Engine** (C++) | Skia graphics rendering, text layout |
| **Embedder** | Platform-specific code (Android/iOS/Web) |

**Key Point**: Flutter renders everything itself using Skia, not native components. This gives pixel-perfect UI across all platforms.

---
