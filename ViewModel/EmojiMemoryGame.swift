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
            MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
                emojis[pairIndex]
                }
        }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
}
  


struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
