//
//  MainView.swift
//  Dobble
//
//  Created by tarrask on 07/02/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameController: GameController
    
    var body: some View {
        VStack {
            if !gameController.multiplayer {
                SinglePlayerView()
            } else {
                MultiplayerView()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    gameController.multiplayer.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title)
                })
            }
            .padding(10)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(GameController())
    }
}
