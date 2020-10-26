//
//  Theme.swift
//  Memorize
//
//  Created by 王莹媛 on 2020/10/23.
//

import SwiftUI

struct Theme<CardContent> {
    let themeName: String
    //a name for the theme
    var cardContents: Array<CardContent>
    //a set of emojis
    let numberOfPairsOfCards: Int
    //a number of cards to show
    let themeColor: Color
    //an appropriate color
    
    init(themeName: String, cardContents: Array<CardContent>, numberOfPairsOfCards: Int?, themeColor: Color) {
        self.themeName = themeName
        self.cardContents = cardContents.shuffled()
        if numberOfPairsOfCards != nil {
            self.numberOfPairsOfCards = numberOfPairsOfCards!
        } else {
            self.numberOfPairsOfCards = Int.random(in: 2...cardContents.count)
        }
        print(self.numberOfPairsOfCards)
        //TODO: 简化代码
        self.themeColor = themeColor
    }
}
