//
//  extension.swift
//  SwiftUI-Basic-1
//
//  Created by Ayberk Bilgiç on 12.10.2022.
//

import Foundation

extension Array {
    var oneAndOnly : Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
