//
//  ListPage.swift
//  DemoTimer
//
//  Created by keloopA on 2024/2/29.
//

import SwiftUI

struct ListPage: View {
    @StateObject var score = Item(name: "666")
    var body: some View {
        NavigationView(content: {
            Text("List")
        })
        .navigationBarTitle(Text("List"), displayMode: .large)
        
    }
}

#Preview {
    ListPage()
}
