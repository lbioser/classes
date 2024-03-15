//
//  StoryView.swift
//  Choose Your Own Stroy
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(story:allstory, pageIndex:1)
        }
    }
}

#Preview {
    StoryView()
}
