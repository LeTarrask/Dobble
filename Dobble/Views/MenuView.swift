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
                        Button(action: {
                            gameController.multiplayer = false
                            startGame.toggle()
                        }) {
                            Image("1pBlack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .opacity(startGame ? 0.5 : 1)
                        }
                        
                        Button(action: {
                            gameController.multiplayer = true
                            startGame.toggle()
                        }) {
                            Image("2pBlack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .opacity(startGame ? 0.5 : 1)
                        }
                        
                    }
                }.padding()
            }
            .navigationTitle("")
            .navigationDestination(isPresented: $startGame) { MainView() }
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
