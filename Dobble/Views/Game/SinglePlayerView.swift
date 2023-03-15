//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct SinglePlayerView: View {
    @EnvironmentObject var gameController: GameController
    
    @State private var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(NSLocalizedString("SCORE: ", comment: ""))
                            .fontWeight(.black)
                        Text(String(gameController.score))
                    }
                    HStack {
                        Text(NSLocalizedString("TIME LEFT: ", comment: ""))
                            .fontWeight(.black)
                        Text(String(timeRemaining))
                    }
                }
                .padding(.horizontal)
                VStack {
                    ForEach(gameController.showingCards, id: \.self) { card in
                        CardView(card: card, player: 1)
                            .frame(width: 430, height: 270)
                    }
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
                        Text(NSLocalizedString("You scored ", comment: "") + String(gameController.score * timeRemaining))
                        Button(NSLocalizedString("Play again", comment: "")) {
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
        .onAppear {
            if gameController.gameOver {
                gameOver()
            } else {
                startGame()
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameController()
//        game.gameOver = true
        return SinglePlayerView()
            .environmentObject(game)
    }
}
