//  ContentView.swift
//  MinuteMediaPlayerDemo
//
//  Created by Nadav Elran on 23/03/2025.
//

import SwiftUI
import MinuteMediaKit

struct ContentView: View {
    private let minuteMediaPlayer = MinuteMediaPlayer(id: "89898-4529537")

    @State private var isPlaying: Bool = false
    @State private var isMuted: Bool = false
    @State private var isCcToggled: Bool = false

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    MinuteMediaPlayerView(
                        player: minuteMediaPlayer,
                        configuration: MinuteMediaKit.configuration
                    )
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding(.horizontal)

                    ForEach(0..<4, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.blue.opacity(0.7))
                            .frame(height: 150)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }

                    ForEach(0..<8, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.green.opacity(0.7))
                            .frame(height: 150)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                Spacer()
                HStack(spacing: 16) {
                    // Rewind
                    Button(action: {
                        minuteMediaPlayer.rewind()
                    }) {
                        Image(systemName: "gobackward.10")
                            .font(.title2)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                    }

                    // Play/Pause
                    Button(action: {
                        minuteMediaPlayer.togglePlay()
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.title2)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                    }

                    // Mute/Unmute
                    Button(action: {
                        minuteMediaPlayer.toggleMute()
                    }) {
                        Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                            .font(.title2)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                    }

                    // Skip Forward
                    Button(action: {
                        minuteMediaPlayer.fastForward()
                    }) {
                        Image(systemName: "goforward.10")
                            .font(.title2)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                    }

                    // CC Toggle
                    Button(action: {
                        minuteMediaPlayer.toggleShowingClosedCaptions()
                    }) {
                        Image(systemName: isCcToggled ? "captions.bubble.fill" : "captions.bubble")
                            .font(.title2)
                            .padding()
                            .background(Circle().fill(Color.black.opacity(0.6)))
                    }
                }
                .foregroundColor(.white)
                .padding(.bottom, 24)
            }
        }
        // Subscribe to player published states
        .onReceive(minuteMediaPlayer.isPlayingPublisher) { playing in
            isPlaying = playing
        }
        .onReceive(minuteMediaPlayer.isMutedPublisher) { muted in
            isMuted = muted
        }
        .onReceive(minuteMediaPlayer.isShowingCloseCaptionsPublisher) { ccOn in
            isCcToggled = ccOn
        }
    }
}

#Preview {
    ContentView()
}
