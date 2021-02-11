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
                Text("Score: \(String(describing: gameController.score))")
                VStack {
                    ForEach(gameController.showingCards, id: \.self) { card in
                        CardView(chosen: card, gameController: gameController)
                    }
                }
            }
            
            GameOver(show: $isPlaying)
        }
    }
}

struct GameOver: View {
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if !show {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.red)
                    VStack {
                        Text("Game Over")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.black)
                        Button("Play again") {
                            show.toggle()
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
