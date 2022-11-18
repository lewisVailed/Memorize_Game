//
//  Cardify.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 4.11.2022.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill(.white).foregroundColor(.white)
                shape.stroke(lineWidth: DrawingConstants.lineWidth)
                content
            } else {
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }

    }
    
    
}
