//
//  MultiplayerView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct MultiplayerView: View {
    @ObservedObject var gameController = GameController()
        
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(NSLocalizedString("Score: ", comment: "") + String(describing: gameController.score))
                    Spacer()
                }.padding(.horizontal)
                CardView(chosen: gameController.showingCards[0], gameController: gameController)
                Spacer()
                VStack {
                    HStack {
                        Text(NSLocalizedString("Score: ", comment: "") + String(describing: gameController.scoreTwo))
                        Spacer()
                    }.padding(.horizontal)
                    CardView(chosen: gameController.showingCards[1], gameController: gameController)
                }
                .rotationEffect(.degrees(180))
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
    }
}
