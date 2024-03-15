//
//  CardManager.swift
//  Test3
//
//  Created by keloopA on 2024/3/4.
//

import Foundation

class CardManager: ObservableObject {
    static let emojis = ["🐥","🦆","🧚🏻‍♂️","🐰","🍄","🐼","🐶","🦁"]
    
   @Published  var cardModel = CardModel(numberOfCardPair: 4) { index in
        emojis[index]
    }
    func shuffle() {
        cardModel.shuffle()
    }
    
    func chooseCard(_ card:CardModel<String>.Card){
        cardModel.chooseCard(card)
    }
}
