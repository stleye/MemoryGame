//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sebastian Tleye on 28/06/2022.
//

import Foundation
import SwiftUI

struct EmojiThemes {

    static let flags = Theme(name: "Flags",
                             emojis: ["π¦πΆ", "π§π³", "πΉπ©", "π°πΎ", "π¨π³", "π΄ββ οΈ", "π¬πͺ", "π¬πΉ", "π·πΊ", "πΊπΈ", "π΄σ §σ ’σ ·σ ¬σ ³σ Ώ", "πΊπΎ", "πΊπ¬", "π΄σ §σ ’σ ³σ £σ ΄σ Ώ", "πΉπ°", "πΉπ¬", "π°π³", "π°π·", "πΈπ°", "πΏπ¦", "πΈπ²", "π·πͺ", "πΆπ¦", "π³πͺ"],
                             numberOfPairsOfCards: 3,
                             color: "cyan")

    static let vehicles = Theme(name: "Vehicles",
                                emojis: ["π", "π", "π", "π", "π", "π", "π", "π"],
                                numberOfPairsOfCards: 3,
                                color: "red")

    static let animals = Theme(name: "Animals",
                               emojis: ["πΈ", "π¦", "π€", "π", "π", "π", "π¦", "π¦§", "π³", "πͺ"],
                               numberOfPairsOfCards: 10,
                               color: "red")
    
    static let themes = [flags, vehicles, animals]

}

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card

    var cards: [Card] {
        return model.cards
    }

    @Published private var model: MemoryGame<String>
    static private var theme = EmojiThemes.animals

    init() {
        Self.theme.emojis.shuffle()
        self.model = MemoryGame<String>(numberOfPairsOfCards: EmojiMemoryGame.theme.numberOfPairsOfCards,
                                        createCardContent: { pairIndex in
            EmojiMemoryGame.theme.emojis[pairIndex]
        })
    }

    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }

    func restart() {
        Self.theme = EmojiThemes.themes.randomElement()!
        Self.theme.emojis.shuffle()
        self.model = MemoryGame<String>(numberOfPairsOfCards: Self.theme.numberOfPairsOfCards,
                                        createCardContent: { pairIndex in
            Self.theme.emojis[pairIndex]
        })
    }

    var cardColor: Color {
        switch Self.theme.color {
        case "orange":
            return .orange
        case "red":
            return .red
        case "blue":
            return .blue
        case "brown":
            return .brown
        case "cyan":
            return .cyan
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "black":
            return .black
        default:
            return .white
        }
    }

}
