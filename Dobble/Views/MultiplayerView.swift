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
        VStack {
            Text("Score: \(String(describing: gameController.score))")
            VStack {
                ForEach(gameController.showingCards, id: \.self) { card in
                    CardView(chosen: card, gameController: gameController)
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
