//
//  ContentView.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import SwiftUI

struct GameView: View {
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
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 250, height: 150)
            VStack {
                HStack {
                    ForEach(chosen.images[0...3], id: \.self) { image in
                        IconView(image: image)
                            .onTapGesture {
                                gameController.pick(value: image)
                            }
                    }
                }
                HStack {
                    ForEach(chosen.images[4...7], id: \.self) { image in
                        IconView(image: image)
                            .onTapGesture {
                                gameController.pick(value: image)
                            }
                    }
                }
            }
        }
    }
}

struct IconView: View {
    let image: String
    
    var body: some View {
        Text(image)
            .font(.system(size: CGFloat.random(in: 20..<60)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
