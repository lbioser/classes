//
//  FavoriteView.swift
//  AbountMe
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack(content: {
            Text("Favoritest")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            Text("hobbies")
                .font(.title2)
            
            HStack(content: {
                ForEach(information.hobbies, id: \.self) { hobby in
                        Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 60)
                }.padding()
            }).padding()
            
            Text("Foods")
                .font(.title2)
            HStack(spacing:60, content: {
                ForEach(information.foods,id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            })
            .padding()
            
            Text("Favorite Colors")
                .font(.title2)
            HStack(content: {
                ForEach(information.colors) { color in
                    color
                        .frame(width:70,height: 70)
                        .cornerRadius(10)
                        
                }
            })
            
        })
    }
}

#Preview {
    FavoriteView()
}
