//
//  EmojiMemoryGame.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 16.09.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis: [String] = ["🚅","🚀","✈️","🚗","🚒","🚜","🚡","🚆","🚄","🛳","🚤","🚌","🚕","🚎","🏎","🚓","🛻"]

    static func createMemoryGame() -> MemoryGame<String> {
            MemoryGame<String>(numberOfPairsOfCards: 12) { pairIndex in
                emojis[pairIndex]
                }
        }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
}
  


