//
//  EmojiMemoryGame.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 16.09.2022.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "🐸"
}

class EmojiMemoryGame {
    
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { (index: Int) -> String in
            return "🐸"
    })
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
