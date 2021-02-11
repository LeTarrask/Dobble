//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct SinglePlayerView: View {
    @ObservedObject var gameController = SinglePlayerGameController()
    
    @State var isPlaying: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Score: \(String(describing: gameController.score))")
                    Spacer()
                    Text("Time left: \(String(describing: gameController.timeLeft))")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
