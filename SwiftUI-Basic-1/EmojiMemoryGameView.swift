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
        
//       VStack {
//           ScrollView {
//               LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                    ForEach(game.cards) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3 , content: { card in
            cardView(for: card)
        })
                        
//                      }
//                }
//            }
    
        
        .foregroundColor(.red)
        .padding(.horizontal)
    }
  
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
            }
        }
    }
    
}

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
            GeometryReader(content: { geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    if card.isFaceUp {
                        shape.fill(.white)
                        shape.stroke(lineWidth: DrawingConstants.lineWidth)
                        Text(card.content).font(font(in: geometry.size))
                    } else if card.isMatched {
                        shape.opacity(0.0)
                    } else {
                        shape.fill(.red)
                    }
                }

            })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width,  size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth : CGFloat = 4
        static let fontScale : CGFloat = 0.75
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

