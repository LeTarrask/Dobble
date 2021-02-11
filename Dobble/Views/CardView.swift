//
//  CardView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

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

