//
//  StoryPageView.swift
//  Choose Your Own Stroy
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct StoryPageView: View {
    let story: Story
    let pageIndex: Int
    var body: some View {
        VStack{
            ScrollView {
                Text(story[pageIndex].text)
            }
            ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
                NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                    frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(8)
                }
            }
        }.padding()
            .navigationTitle("Page \(pageIndex + 1)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StoryPageView(story: allstory, pageIndex: 1)
}
