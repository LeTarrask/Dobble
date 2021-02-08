//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct ContentView: View {
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

struct CardView: View {
    let chosen: Card
    
    @ObservedObject var gameController: GameController

    var body: some View {
        HStack {
            ForEach(chosen.images.shuffled(), id: \.self) { image in
                Text(image)
                    .font(.title)
                    .onTapGesture {
                        gameController.pick(value: image)
                    }
            }
        }.background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
