//
//  MainView.swift
//  Dobble
//
//  Created by tarrask on 07/02/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameController: GameController
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            if !gameController.multiplayer {
                SinglePlayerView()
            } else {
                MultiplayerView()
            }
            
            HStack {
                Banner()
                Spacer()
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title)
                })
            }
            .padding(10)
        }
        .sheet(isPresented: $showingSheet) {
            SettingsView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(GameController())
    }
}
