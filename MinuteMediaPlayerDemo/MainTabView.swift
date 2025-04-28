//  MainTabView.swift
//  MinuteMediaPlayerDemo
//
//  Created by Nadav Elran on 07/04/2025.
//

import SwiftUI

struct MainTabView: View {
    enum TabSelection {
        case player, editConfig
    }
    
    @State private var selectedTab: TabSelection = .player
    @State private var playerViewID = UUID()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .id(playerViewID)
                .tabItem {
                    Label("Player", systemImage: "play.rectangle")
                }
                .tag(TabSelection.player)
            
            EditConfigurationView()
                .tabItem {
                    Label("Edit Config", systemImage: "slider.horizontal.3")
                }
                .tag(TabSelection.editConfig)
        }
        .onChange(of: selectedTab) { _, newValue in
            if newValue == .player {
                playerViewID = UUID()
            }
        }
    }
}

#Preview {
    MainTabView()
}
