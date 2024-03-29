//
//  CardView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    let player: Int
    
    @EnvironmentObject var gameController: GameController

    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundColor(Color("kawaiiGray")).opacity(0.65)
                
                VStack {
                    HStack {
                        ForEach(card.images[0...3].shuffled(), id: \.self) { image in
                            IconView(image: image)
                                .onTapGesture {
                                    gameController.pick(value: image, player: player)
                                }
                        }
                    }
                    HStack {
                        ForEach(card.images[4...7].shuffled(), id: \.self) { image in
                            IconView(image: image)
                                .onTapGesture {
                                    gameController.pick(value: image, player: player)
                                }
                        }
                    }
                }.padding(20)
            }
        }.padding(40)
    }
}


struct Previews_CardView_Previews: PreviewProvider {
    static var previews: some View {
        let controller = GameController()
        let card = controller.showingCards[0]
        return CardView(card: card, player: 1).frame(width: 400, height: 300)
    }
}
