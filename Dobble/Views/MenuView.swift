//
//  MenuView.swift
//  Dobble
//
//  Created by tarrask on 12/02/2022.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gameController: GameController
    
    @State var startGame: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("kawaiiPink")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 40) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    HStack {
                        NavigationLink("",
                                       destination: MainView(),
                                       isActive: $startGame)
                        
                        Button(action: {
                            // TO DO: blink button
                            gameController.multiplayer = false
                            startGame.toggle()
                        }) {
                            Image("1pBlack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                        }
                        
                        Button(action: {
                            // TO DO: blink button
                            gameController.multiplayer = true
                            startGame.toggle()
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
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewDevice("iPhone 8")
            .environmentObject(GameController())
    }
}
