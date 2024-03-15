//
//  ContentView.swift
//  DemoTimer
//
//  Created by keloopA on 2024/2/29.
//

import SwiftUI

struct ContentView: View {
    @State var seletedV = 0
    @State var defaultTime = 20
    var body: some View {
        TabView(selection: $seletedV) {
            TimerPage()
                .tabItem {
                    Label(title:{
                        Text("Timer")
                    }) {
                        Image(systemName: "timer.square")
                    }
                }
            SettingPage(defaultTime: $defaultTime)
                .tabItem {
                    Label(title:{
                        Text("Timer")
                    }) {
                        Image(systemName: "gearshape")
                    }
                }
            
                ListPage().tabItem {
                    Label(title:{
                        Text("Timer")
                    }) {
                        Image(systemName: "list.dash")
                    }
                }
            
            
        }
    }
}

#Preview {
    ContentView()
}
