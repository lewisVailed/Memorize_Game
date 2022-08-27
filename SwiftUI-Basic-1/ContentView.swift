//
//  ContentView.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🚅","🚀","✈️","🚗","🚒"]
    @State var emojiCount: Int = 2
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                }
            }
            Spacer()
            HStack {
                add
                Spacer()
                Text("Memorize").font(.largeTitle)
                Spacer()
                remove
            }
            .padding()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
            emojiCount += 1
            }
        } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
        }
    }
    var remove: some View {
        Button  {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
                    
         
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

