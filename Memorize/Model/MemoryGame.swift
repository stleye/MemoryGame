//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sebastian Tleye on 28/06/2022.
//

import Foundation

extension Array {
    
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        }
        return nil
    }
    
}

struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyCardFaceUp: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
    }

    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyCardFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyCardFaceUp = chosenIndex
            }
        }
    }

    mutating func shuffle() {
        self.cards.shuffle()
    }

}
