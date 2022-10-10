//
//  EmojiMemoryGameView.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 18.08.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject  var game: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    game.choose(card)
                                }
                        }
                }
            }
            .foregroundColor(.red)
    
        }
        .padding(.horizontal)
    }
  
}

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 4)
                Text(card.content).font(.largeTitle)
                
            } else if card.isMatched {
                shape.opacity(0.0)
            } else {
                shape.fill(.red)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}

