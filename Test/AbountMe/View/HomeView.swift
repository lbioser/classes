//
//  HomeView.swift
//  AbountMe
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(content: {
            Text("All About")
                .font(Font.system(size: 15,weight: .bold))
                .padding()
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            Text(information.name)
                .font(.title)
                
        })
    }
}

#Preview {
    HomeView()
}
