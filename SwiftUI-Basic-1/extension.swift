//
//  extension.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 12.10.2022.
//

import Foundation
import SwiftUI

extension Array {
    var oneAndOnly : Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable{
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    var body: some View {
        let width: CGFloat = 100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
            ForEach(items) { item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)

            }
        }
    }
}
