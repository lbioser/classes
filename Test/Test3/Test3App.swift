//
//  Test3App.swift
//  Test3
//
//  Created by keloopA on 2024/3/4.
//

import SwiftUI

@main
struct Test3App: App {
    @StateObject var cardManager = CardManager()
    var body: some Scene {
        WindowGroup {
            CardGameView().environmentObject(cardManager)
        }
    }
}
