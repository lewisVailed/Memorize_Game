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
            gameBody
            shuffle
        }
        .padding()
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3 ) { card in
            if card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
    }
    
    
    
    var shuffle: some View {
        Button("Shuffle") {
            game.shuffle()
        }
    }
    
    struct CardView: View {
        private let card: EmojiMemoryGame.Card
        
        init(_ card: EmojiMemoryGame.Card) {
            self.card = card
        }
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Pie(startAngle: Angle(degrees: 0-90),
                        endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.5)
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
        
        
        
        private func scale(thatFits size: CGSize) -> CGFloat {
            min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
        }
        
    }
    
    public struct ContentView_Previews: PreviewProvider {
        public static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
    }
    
}
