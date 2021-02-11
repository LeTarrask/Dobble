//
//  MultiplayerView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct MultiplayerView: View {
    @ObservedObject var gameController = MultiPlayerGameController()
    
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

struct MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerView()
    }
}
