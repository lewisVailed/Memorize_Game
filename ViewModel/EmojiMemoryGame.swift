//
//  EmojiMemoryGame.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 16.09.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    
    static let emojis: [String] = ["🚅","🚀","✈️","🚗","🚒","🚜","🚡","🚆","🚄","🛳","🚤","🚌","🚕","🚎","🏎","🚓","🛻"]

    static func createMemoryGame() -> MemoryGame<String> {
            MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                emojis[pairIndex]
                }
        }
    
    @Published private var model : MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
}
  

