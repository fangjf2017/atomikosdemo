# Kids English - iOS Learning App 📚

A colorful and fun iOS app to help children aged 3-5 learn English through interactive stories and the alphabet.

## Features

### 📖 Story Time
- **6 illustrated stories** with emoji-based illustrations
- **Word highlighting** — key vocabulary words are highlighted in each page
- **Page-by-page reading** with smooth slide animations
- **Celebration screen** when a story is completed with star ratings
- Stories include: The Happy Sun, My Little Cat, The Red Apple, A Rainy Day, Farm Animals, Colors of the World

### 🔤 Alphabet Learning
- All **26 letters A-Z** displayed in a colorful grid
- Tap any letter to see a full-screen detail view with:
  - Big uppercase/lowercase letter display with bounce animation
  - Associated emoji and vocabulary word
  - Phonetic sound hint

## Technical Details

- **Language**: Swift 5.0
- **UI Framework**: SwiftUI
- **Minimum iOS**: 17.0
- **Supports**: iPhone & iPad
- **Architecture**: MVVM-ready with clean model/view separation

## Project Structure

```
KidsEnglish/
├── KidsEnglishApp.swift          # App entry point
├── Views/
│   ├── HomeView.swift            # Main tab view + welcome splash
│   ├── StoryListView.swift       # Story selection grid
│   ├── StoryReaderView.swift     # Story page reader with highlighting
│   └── AlphabetView.swift        # A-Z grid + letter detail sheet
├── Models/
│   ├── Story.swift               # Story & StoryPage data models
│   ├── StoryData.swift           # All story content
│   └── AlphabetData.swift        # Alphabet letter data
└── Assets.xcassets/              # Color palette assets
```

## Getting Started

1. Open `KidsEnglish.xcodeproj` in Xcode 15+
2. Select your target device (iPhone or iPad)
3. Press ▶ to build and run

## Color Palette

| Name | Usage |
|------|-------|
| `appleRed` | Primary accent, story card |
| `softOrange` | Cat story, warm tones |
| `sunYellow` | Sun story, highlights |
| `grassGreen` | Farm story, nature |
| `skyBlue` | Rain story, backgrounds |
| `purpleDream` | Alphabet section |
