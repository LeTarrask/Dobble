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
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title)
                })
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }.padding()
            
            if !gameController.multiplayer {
                SinglePlayerView()
            } else {
                MultiplayerView()
            }
            
            Banner()
        }
        .sheet(isPresented: $showingSheet) {
            SettingsView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
            .environmentObject(GameController())
    }
}
