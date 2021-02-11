//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct SinglePlayerView: View {
    @ObservedObject var gameController = GameController()
    
    @State var isPlaying: Bool = true
    
    @State private var timeRemaining = 580
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Score: \(String(describing: gameController.score))")
                    Spacer()
                    Text("Time left: \(timeRemaining)")
                }
                .padding(.horizontal)
                VStack {
                    ForEach(gameController.showingCards, id: \.self) { card in
                        CardView(chosen: card, gameController: gameController)
                    }
                }
            }
            if gameController.gameOver {
                GameOver(gameController: gameController)
            }
        }
        .onReceive(timer) { time in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
