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
        LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
            ForEach(items) { item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)

            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        GridItem(.adaptive(minimum: width))
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}
