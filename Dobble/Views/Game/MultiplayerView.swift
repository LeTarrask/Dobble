//
//  MultiplayerView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct MultiplayerView: View {
    @EnvironmentObject var gameController: GameController
    
    @State private var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = false
        
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
                        .frame(width: 430, height: 270)
                }.rotationEffect(.degrees(180))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(NSLocalizedString("SCORE TWO: ", comment: ""))
                            .fontWeight(.black)
                        Text(String(gameController.scoreTwo))
                    }.padding(.leading).padding(.horizontal)
                    CardView(card: gameController.showingCards[1], player: 2)
                        .frame(width: 430, height: 270)
                }
            }
            if gameController.gameOver {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 300, height: 300)
                        .foregroundColor(Color("kawaiiDarkPink"))
                    VStack {
                        Image("gameover")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        if gameController.score > gameController.scoreTwo {
                            Text(NSLocalizedString("Player 1 wins", comment: ""))
                        } else {
                            Text(NSLocalizedString("Player 2 wins", comment: ""))
                        }
                        Button("Play again") {
                            startGame()
                        }.foregroundColor(.white)
                        .font(.subheadline)
                    }
                }
            }
        }
        .onReceive(timer) { time in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            if self.timeRemaining == 0 {
                gameOver()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.isActive = true
        }
    }
    
    func gameOver() {
        gameController.gameOver = true
        isActive = false
    }
    
    func startGame() {
        gameController.gameOver = false
        timeRemaining = 580/gameController.difficulty
        isActive = true
    }
}

struct MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameController()
        game.gameOver = true
        return MultiplayerView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
            .environmentObject(game)
    }
}
