//
//  ContentView.swift
//  Test3
//
//  Created by keloopA on 2024/3/4.
//

import SwiftUI

struct CardGameView: View {
    
   @EnvironmentObject var cardManager:CardManager
    
    var body: some View {
        VStack{
            
            ScrollView{
                       LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 100))], content: {
                           ForEach(cardManager.cardModel.cards){card in
                               CardView(card: card)
                           }
                       })
                   }
            
            Button(action: {
                cardManager.shuffle()
            }, label: {
                Text("Shuffle")
            })
        }
       
    }
}


struct CardView: View {
    @EnvironmentObject var cardManager:CardManager
    let card: CardModel<String>.Card
    var body: some View{
        ZStack {
            
                RoundedRectangle(cornerRadius: 12)
                .fill(card.isFaceup ? .white : .orange)
                    .strokeBorder(.orange, style: .init())
                    .aspectRatio(1.5, contentMode: .fill)
                    .opacity(card.isMatched ? 0 : 1)
            if card.isFaceup {
                Text(card.content)
                    .font(.largeTitle)
            }
                
            
        }.onTapGesture {
            cardManager.chooseCard(card)
        }
        
    }
}

#Preview {
    CardGameView()
}
