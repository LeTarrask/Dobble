//
//  MenuView.swift
//  Dobble
//
//  Created by tarrask on 12/02/2022.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        ZStack {
            Color("kawaiiPink")
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 40) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                HStack {
                    Button(action: {
                        // TO DO: blink button
                        // TO DO: go to 1p game
                    }) {
                        Image("1pBlack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                    }
                    
                    Button(action: {
                        // TO DO: blink button
                        // TO DO: go to 2p game
                    }) {
                        Image("2pBlack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewDevice("iPhone 8")
    }
}
