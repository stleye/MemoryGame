//
//  Theme.swift
//  Memorize
//
//  Created by Sebastian Tleye on 02/07/2022.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var color: String

    init(name: String, emojis: [String], numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = min(numberOfPairsOfCards, emojis.count)
        self.color = color
    }
}
