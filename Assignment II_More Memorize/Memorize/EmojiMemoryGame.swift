//
//  EmojiMemorryGame.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/9/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    //MARK: - 6 different themes
    static let themeOfHalloween = Theme<String>(themeName: "Halloween", cardContents: ["👻","🎃","🕷️","🍬","🥩"], numberOfPairsOfCards: nil, themeColor: .orange)
    static let themeOfAnimals = Theme<String>(themeName: "Animals", cardContents: ["🐼", "🐶", "🐔", "🦊"], numberOfPairsOfCards: 4, themeColor: .gray)
    static let themeOfSports = Theme<String>(themeName: "Sports", cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸"], numberOfPairsOfCards: nil, themeColor: .red)
    static let themeOfFaces = Theme<String>(themeName: "Faces", cardContents: ["😀","🤣", "🤬", "😇", "😎", "🥺", "🥰","😭"], numberOfPairsOfCards: 6, themeColor: .yellow)
    static let themeOfFruit = Theme<String>(themeName: "Fruit", cardContents: ["🍎","🍐","🍊","🍋","🍇"], numberOfPairsOfCards: nil, themeColor: .green)
    static let themeOfVehicles = Theme<String>(themeName: "Vehicles", cardContents: ["🚗","🚲","✈️","🚄","🚌"], numberOfPairsOfCards: nil, themeColor: .blue)
    
    //MARK: - Initialization
    
    static let themeList = [themeOfHalloween, themeOfAnimals, themeOfSports, themeOfFaces, themeOfFruit, themeOfVehicles]
    static var themeChosen = themeList.randomElement()!
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = themeChosen.cardContents
        emojis = emojis.shuffled()
        //Have the emoji be randomly chosen
        return MemoryGame<String>(numberOfPairsOfCards: themeChosen.numberOfPairsOfCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    //MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        EmojiMemoryGame.themeChosen = EmojiMemoryGame.themeList.randomElement()!
        model = EmojiMemoryGame.createMemoryGame()
    }

}
