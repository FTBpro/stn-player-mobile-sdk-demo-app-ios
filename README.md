
# MinuteMediaPlayer Demo

A demo application showcasing the **MinuteMediaKit** SDK, including:

- A SwiftUI video player view (`MinuteMediaPlayerView`) that wraps `MinuteMediaPlayer`.
- Floating playback controls (play/pause, mute/unmute, rewind, skip, captions toggle).
- A live-editable UI configuration screen for colors, supported modes, and control visibility.

---

## 🚀 Features

- **Two usage patterns**
  1. Embed `MinuteMediaPlayerView` directly.
  2. Instantiate and reuse a `MinuteMediaPlayer` instance, then pass it into `MinuteMediaPlayerView(player:configuration:)`.
- **Floating Controls**
  - Rewind 10s, Play/Pause, Mute/Unmute, Skip 10s, Toggle Closed Captions.
- **Edit UI Configuration**
  - `EditConfigurationView` lets you adjust:
    - Foreground & background colors
    - Which modes are supported (standard, full screen, minimized)
    - Which UI elements are shown (title, description, controls, progress bar)
    - Auto full‑screen behavior on landscape
- **Tab Navigation**
  - **Player**: View the video and controls.
  - **Edit Config**: Tweak the UI configuration in real time.

---

## 📋 Requirements

- **Xcode** 15 or later
- **iOS** 15.0+ (or macOS 12+ / Mac Catalyst 15+ / tvOS 15+ / watchOS 6+)
- **Swift** 5.6 or later
- **Swift Package Manager** (used for importing `MinuteMediaKit`)

---

## 🛠 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/HeadLightsDev/MinuteMediaPlayerDemo.git
   cd MinuteMediaPlayerDemo
   ```

2. **Open in Xcode**
   ```bash
   open MinuteMediaPlayerDemo.xcodeproj
   ```
   > The demo uses Swift Package Manager to fetch **MinuteMediaKit** automatically.

3. **Configure your API key**
   - In `MinuteMediaPlayerDemoApp.swift`, replace:
     ```swift
     MinuteMediaKit.initialize(apiKey: "YOUR_API_KEY")
     ```
     with your own API key.

4. **Build & Run**
   - Select the **MinuteMediaPlayerDemo** target and hit **Run** (⌘R).

---

## 🎬 Usage

1. **Player Tab**
   - Watch the demo video.
   - Use floating controls overlaid on top to interact.
2. **Edit Config Tab**
   - Change colors, toggle which controls appear, choose supported modes.
   - Tap **Apply Configuration** to see changes live.
