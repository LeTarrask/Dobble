//
//  MultiplayerView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct MultiplayerView: View {
    @ObservedObject var gameController = GameController()
    
    @State var isPlaying: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Score: \(String(describing: gameController.score))")
                    Spacer()
//                    Text("Time left: \(String(describing: gameController.timeLeft))")
                }.padding(.horizontal)
                CardView(chosen: gameController.showingCards[0], gameController: gameController)
                Spacer()
                VStack {
                    HStack {
                        Text("Score: \(String(describing: gameController.scoreTwo))")
                        Spacer()
//                        Text("Time left: \(String(describing: gameController.timeLeft))")
                    }.padding(.horizontal)
                    CardView(chosen: gameController.showingCards[1], gameController: gameController)
                }
                .rotationEffect(.degrees(180))
            }
            if gameController.gameOver {
                GameOver(gameController: gameController)
            }
        }
    }
}

struct MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerView()
    }
}
