//
//  GameOver.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct GameOver: View {
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if !show {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.red)
                    VStack {
                        Text("Game Over")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.black)
                        Button("Play again") {
                            show.toggle()
                        }.foregroundColor(.white)
                        .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver(show: .constant(false))
    }
}
