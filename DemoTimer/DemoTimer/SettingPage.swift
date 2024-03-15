//
//  SettingPage.swift
//  DemoTimer
//
//  Created by keloopA on 2024/2/29.
//

import SwiftUI

struct SettingPage: View {
    @Binding var defaultTime: String
    var body: some View {
        VStack {
            Text("Setting Timer value")
            TextField("default time", text: $defaultTime)
        }
    }
}


