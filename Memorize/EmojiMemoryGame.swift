//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sebastian Tleye on 28/06/2022.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = [
        ["🇦🇶", "🇧🇳", "🇹🇩", "🇰🇾", "🇨🇳", "🏴‍☠️", "🇬🇪", "🇬🇹", "🇷🇺", "🇺🇸", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇺🇾", "🇺🇬", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇹🇰", "🇹🇬", "🇰🇳", "🇰🇷", "🇸🇰", "🇿🇦", "🇸🇲", "🇷🇪", "🇶🇦", "🇳🇪"],
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑"],
        ["🐸", "🦎", "🐤", "🐝", "🐒", "🐆", "🦒", "🦧", "🐳", "🐪"]
    ]
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 4,
                                           createCardContent: { pairIndex in
        EmojiMemoryGame.emojis[0][pairIndex]
    })

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
