//
//  ContentView.swift
//  AbountMe
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabSelection = .Story
    var body: some View {
        VStack {
            Text(tabSelection.rawValue)
            TabView(selection: $tabSelection,
                    content:  {
                HomeView().tabItem { Label(
                    title: { Text("home") },
                    icon: { Image(systemName: "person")}
                ) }
                .badge(2)
                .tag(TabSelection.Home)
                StoryView()
                    .tabItem {
                        Label("Story", systemImage: "book")
                    }
                    .tag(TabSelection.Story)
                FavoriteView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                    .tag(TabSelection.Favorite)
                FunFactsView()
                    .tabItem {
                        Label("Fun Facts", systemImage: "hand.thumbsup")
                    }
                    .tag(TabSelection.FunFacts)
            }).tint(.green)
        }
    }
    
}
enum TabSelection: String {
    case Home
    case Story
    case Favorite
    case FunFacts
}
#Preview {
    ContentView()
}
