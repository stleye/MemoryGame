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

//    var remove: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: { Image(systemName: "minus.circle") })
//    }
//
//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis[theme].count {
//                emojiCount += 1
//            }
//        }, label: { Image(systemName: "plus.circle") })
//    }
//
//    var flags: some View {
//        Button(action: {
//            theme = 0
//            emojis[theme].shuffle()
//            emojiCount = emojis[theme].count
//        }, label: {
//            VStack {
//                Image(systemName: "flag")
//                Text("Flags")
//                    .font(.title3)
//            }
//        })
//    }
//
//    var vehicles: some View {
//        Button(action: {
//            theme = 1
//            emojis[theme].shuffle()
//            emojiCount = emojis[theme].count
//        }, label: {
//            VStack {
//                Image(systemName: "car")
//                Text("Vehicles")
//                    .font(.title3)
//            }
//        })
//    }
//
//    var animals: some View {
//        Button(action: {
//            theme = 2
//            emojis[theme].shuffle()
//            emojiCount = emojis[theme].count
//        }, label: {
//            VStack {
//                Image(systemName: "tortoise")
//                Text("Animals")
//                    .font(.title3)
//            }
//        })
//    }

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
