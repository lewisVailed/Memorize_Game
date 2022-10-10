//
//  SwiftUI_Basic_1App.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 18.08.2022.
//

import SwiftUI

@main
struct SwiftUI_Basic_1App: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
