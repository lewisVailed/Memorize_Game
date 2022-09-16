//
//  MemoryGame.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 16.09.2022.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatch: Bool
        var content: CardContent
    }
}
