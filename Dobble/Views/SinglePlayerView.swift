//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct SinglePlayerView: View {
    @EnvironmentObject var gameController: GameController
        
    @State private var timeRemaining = 300
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(NSLocalizedString("Score: ", comment: "") + String(gameController.score))
                    Spacer()
                    Text(NSLocalizedString("Time left: ", comment: "") + String(timeRemaining))
                }
                .padding(.horizontal)
                VStack {
                    ForEach(gameController.showingCards, id: \.self) { card in
                        CardView(card: card)
                    }
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
                        Text(NSLocalizedString("You scored ", comment: "") + String(gameController.score * timeRemaining))
                        Button(NSLocalizedString("Play again", comment: "")) {
                            gameController.gameOver = false
                            timeRemaining = 580/gameController.difficulty
                            isActive = true
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
                gameController.gameOver = true
                isActive = false
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.isActive = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
