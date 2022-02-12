//
//  MenuView.swift
//  Dobble
//
//  Created by tarrask on 12/02/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color("kawaiiPink")
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 40) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image("playButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                        Image("playText")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                    }
                })
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
