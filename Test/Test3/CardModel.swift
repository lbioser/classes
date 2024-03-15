//
//  CardModel.swift
//  Test3
//
//  Created by keloopA on 2024/3/4.
//

import Foundation
struct CardModel<Content> where Content:Equatable {
    
    private(set) var cards = [Card]()
    
    init(numberOfCardPair:Int,content:(_ index:Int)->Content){
        for i in 0..<numberOfCardPair {
            let carda = Card(id: "\(i)a", content: content(i))
            let cardb = Card(id: "\(i)b", content: content(i))
            cards += [carda, cardb]
        }
        
    }
    
    mutating func shuffle()  {
        cards.shuffle()
    }
    
    var selectedCard = [Card]()
    mutating func chooseCard(_ card:Card){
        
        if selectedCard.count == 2 {
            
        }
        
    }
    
    struct Card: Equatable,Hashable,Identifiable {
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id && lhs.isFaceup == rhs.isFaceup && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
        }
        let id:String
        var isFaceup = false
        var isMatched = false
        let content:Content
        func hash(into hasher: inout Hasher) {
                hasher.combine(isFaceup)
                hasher.combine(isMatched)
        }
    }
}



