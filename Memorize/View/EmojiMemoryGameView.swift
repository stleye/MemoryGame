//
//  ContentView.swift
//  Memorize
//
//  Created by Sebastian Tleye on 26/06/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        //VStack {
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            })
            .foregroundColor(game.cardColor)
            .padding(.horizontal)

//            Button(action: {
//                game.newGame()
//            }, label: { Text("New Game") })
//            .font(.largeTitle)
//            .padding()
        //}
    }

}

struct CardView: View {

    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90),
                    endAngle: Angle(degrees: 110-90))
                    .padding(5).opacity(0.5)
                Text(card.content).font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }

    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstants.fontScale)
    }

    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
