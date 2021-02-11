//
//  SettingsView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct SettingsView: View {
    @State private var multiPlayerMode: Bool = false
    
    @State private var difficulty: Int = 1
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $multiPlayerMode, label: {
                    Text("Multiplayer Mode")
                })
                Stepper(value: $difficulty, in: 1...5) {
                    Text("Difficulty Level: \(difficulty)")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
