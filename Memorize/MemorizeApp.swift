//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sebastian Tleye on 26/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
