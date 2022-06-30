//
//  ContentView.swift
//  Memorize
//
//  Created by Sebastian Tleye on 26/06/2022.
//

import SwiftUI

struct ContentView: View {
 
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }

}

struct CardView: View {

    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(game: game)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
