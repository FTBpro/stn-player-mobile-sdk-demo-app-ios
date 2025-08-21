//
//  EditConfigurationView.swift
//  MinuteMediaPlayerDemo
//
//  Created by Nadav Elran on 07/04/2025.
//

import SwiftUI
import MinuteMediaKit

struct EditConfigurationView: View {
    @State private var foregroundColor: Color = .white
    @State private var backgroundColor: Color = .black
    @State private var showTitle: Bool = true
    @State private var showDescription: Bool = true
    @State private var showDuration: Bool = true
    @State private var playPause: Bool = true
    @State private var muteUnmute: Bool = true
    @State private var closedCaptions: Bool = true
    @State private var skipForward: Bool = true
    @State private var skipBackward: Bool = true
    @State private var progressBar: Bool = true
    @State private var autoFullScreenOnLandscape: Bool = false
    @State private var fullScreenSupportedOnlyOnLandscape: Bool = false
    @State private var supportFullScreen: Bool = true
    @State private var supportMinimized: Bool = true
    @State private var adUnit: String = ""
    @State private var adFrequency: Int = 0

    private var selectedModesDescription: String {
        var modes = [String]()
        if supportFullScreen { modes.append("Full Screen") }
        if supportMinimized { modes.append("Minimized") }
        return modes.isEmpty ? "None" : modes.joined(separator: ", ")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Colors")) {
                    ColorPicker("Foreground Color", selection: $foregroundColor)
                    ColorPicker("Background Color", selection: $backgroundColor)
                }
                
                Section(header: Text("Supported Modes")) {
                    Menu {
                        Button(action: {
                            supportFullScreen.toggle()
                        }) {
                            Label("Full Screen", systemImage: supportFullScreen ? "checkmark" : "")
                        }
                        Button(action: {
                            supportMinimized.toggle()
                        }) {
                            Label("Minimized", systemImage: supportMinimized ? "checkmark" : "")
                        }
                    } label: {
                        HStack {
                            Text("Select Modes")
                            Spacer()
                            Text(selectedModesDescription)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.down")
                        }
                    }
                }

                Section(header: Text("Elements Configuration")) {
                    Toggle("Show Title", isOn: $showTitle)
                    Toggle("Show Description", isOn: $showDescription)
                    Toggle("Show Play/Pause", isOn: $playPause)
                    Toggle("Show Mute/Unmute", isOn: $muteUnmute)
                    Toggle("Show Closed Captions", isOn: $closedCaptions)
                    Toggle("Show Progress Bar", isOn: $progressBar)
                    Toggle("Show Video Duration", isOn: $showDuration)
                    Toggle("Can Skip Forward", isOn: $skipForward)
                    Toggle("Can Skip Backward", isOn: $skipBackward)
                }

                Section(header: Text("Other Options")) {
                    Toggle("Auto FullScreen on Landscape", isOn: $autoFullScreenOnLandscape)
                    Toggle("FullScreen Supported Only on Landscape", isOn: $fullScreenSupportedOnlyOnLandscape)
                }

                Section(header: Text("Ads")) {
                    TextField("Ad Unit (e.g., /123/demo)", text: $adUnit)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    Text("If an Ad Unit is set, 0 will always trigger a preroll ad.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)

                    Stepper(value: $adFrequency, in: 0...20) {
                        HStack {
                            Text("Ad Frequency")
                            Spacer()
                            Text("\(adFrequency)")
                                .monospacedDigit()
                        }
                    }
                }

                Section {
                    Button("Apply Configuration") {
                        let newConfig = UIConfiguration(
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                            elementsConfig: ElementsConfig(
                                playPause: playPause,
                                muteUnmute: muteUnmute,
                                closedCaptions: closedCaptions,
                                skipForward: skipForward,
                                skipBackward: skipBackward,
                                progressBar: progressBar,
                                showTitle: showTitle,
                                showDescription: showDescription,
                                showDuration: showDuration,
                                showErrorView: true
                            ),
                            autoFullScreenOnLandscape: autoFullScreenOnLandscape,
                            supportedModes: {
                                var modes = [MediaPlayerMode.standard]
                                if supportFullScreen { modes.append(.fullScreen) }
                                if supportMinimized { modes.append(.minimized) }
                                return modes
                            }(),
                            fullScreenSupportedOnlyOnLandscape: fullScreenSupportedOnlyOnLandscape
                        )
                        
                        // Update the media player's UI configuration
                        MinuteMediaKit.configuration.uiConfig = newConfig
                        MinuteMediaKit.configuration.adConfig.adUnit = adUnit
                        MinuteMediaKit.configuration.adConfig.frequency = adFrequency
                    }
                }
            }
            .navigationTitle("Edit UI Configuration")
        }
    }
}

#Preview {
    EditConfigurationView()
}
