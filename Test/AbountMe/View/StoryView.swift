//
//  StoryView.swift
//  AbountMe
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            
            ScrollView(.vertical) {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }.padding([.top, .bottom], 50)
    }
}

#Preview {
    StoryView()
}
