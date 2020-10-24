//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/9/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
