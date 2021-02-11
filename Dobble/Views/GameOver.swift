//
//  GameOver.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct GameOver: View {
    @ObservedObject var gameController: SinglePlayerGameController

    var body: some View {
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
                    gameController.gameOver.toggle()
                }.foregroundColor(.white)
                .font(.subheadline)
            }
        }
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver(gameController: SinglePlayerGameController())
    }
}
