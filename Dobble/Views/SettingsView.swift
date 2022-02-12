//
//  SettingsView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var gameController: GameController
    
    @State private var difficulty: Int = 1
    
    var body: some View {
        VStack {
            Form {
                Section("Game Settings") {
                    Toggle(isOn: $gameController.multiplayer, label: {
                        Text(NSLocalizedString("Multiplayer Mode", comment: ""))
                    })
                    Stepper(value: $gameController.difficulty, in: 1...5) {
                        Text(NSLocalizedString("Difficulty Level: ", comment: "") + String(gameController.difficulty))
                    }
                }
            }
            
            Banner()
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(GameController())
    }
}
