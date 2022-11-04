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
        AspectVGrid(items: game.cards, aspectRatio: 2/3 ) { card in
            cardView(for: card)
        }
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
        GeometryReader { geometry in
            ZStack {
            Pie(startAngle: Angle(degrees: 0-90),
                endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.5)
            Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeIn(duration: 1))
                    .font(font(in: geometry.size))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
        
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width,  size.height) * DrawingConstants.fontScale)
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

