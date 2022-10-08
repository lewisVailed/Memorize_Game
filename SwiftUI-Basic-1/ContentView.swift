//
//  ContentView.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
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
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 4)
                Text(card.content).font(.largeTitle)
                
            } else if card.isMatched {
                shape.opacity(0.5)
            } else {
                shape.fill(.red)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

