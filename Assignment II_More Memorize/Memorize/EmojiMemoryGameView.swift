//
//  ContentView.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/9/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
        
    var body: some View {
        VStack {
            Spacer()
            Text(EmojiMemoryGame.themeChosen.themeName).font(.title)
            Divider()
            Text("Score: \(viewModel.score)")
            Grid(viewModel.cards) {card in
                CardView(card:card)
                    //.aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture{
                        viewModel.choose(card: card)
                    }
                    .padding()
            }
            .foregroundColor(EmojiMemoryGame.themeChosen.themeColor)
            .padding()
            Button("New Game",action: {
                viewModel.newGame()
            })
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                    
                } else {
                    if !card.isMatchUp {
                        RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient.init(gradient: Gradient.init(colors: [EmojiMemoryGame.themeChosen.themeColor,Color.white]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
                    }
                }
            }
            .font(.system(size: fontSize(for: geometry.size)))
        }
    }
    
    
    //MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

 



 















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
