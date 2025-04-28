//
//  MinuteMediaPlayerDemoApp.swift
//  MinuteMediaPlayerDemo
//
//  Created by Nadav Elran on 23/03/2025.
//

import SwiftUI
import MinuteMediaKit

@main
struct MinuteMediaPlayerDemoApp: App {
    
    init() {
        MinuteMediaKit.initialize(apiKey: "YOUR_API_KEY")
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
