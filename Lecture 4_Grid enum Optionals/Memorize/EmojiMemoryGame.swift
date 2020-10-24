//
//  EmojiMemorryGame.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/9/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static let cardsNumber = Int.random(in: 2...5)//
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻","🎃","🕷️","🍬","🥩"]
        emojis = emojis.shuffled()
        //Have the emoji be randomly chosen
        return MemoryGame<String>(numberOfPairsOfCards: cardsNumber /*emojis.count*/) { pairIndex in
            //
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
