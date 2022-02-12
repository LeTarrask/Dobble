//
//  MultiplayerView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct MultiplayerView: View {
    @EnvironmentObject var gameController: GameController
        
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(NSLocalizedString("SCORE ONE: ", comment: ""))
                            .fontWeight(.black)
                        Text(String(gameController.score))
                    }.padding(.leading)
                    CardView(card: gameController.showingCards[0], player: 1)
                }.rotationEffect(.degrees(180))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(NSLocalizedString("SCORE ONE: ", comment: ""))
                            .fontWeight(.black)
                        Text(String(gameController.scoreTwo))
                    }.padding(.leading).padding(.horizontal)
                    CardView(card: gameController.showingCards[1], player: 2)
                }
            }
            if gameController.gameOver {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.red)
                    VStack {
                        Text(NSLocalizedString("Game Over", comment: ""))
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.black)
                        if gameController.score > gameController.scoreTwo {
                            Text(NSLocalizedString("Player 1 wins", comment: ""))
                        } else {
                            Text(NSLocalizedString("Player 2 wins", comment: ""))
                        }
                        Button("Play again") {
                            gameController.gameOver.toggle()
                        }.foregroundColor(.white)
                        .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerView()
            .environmentObject(GameController())
    }
}
