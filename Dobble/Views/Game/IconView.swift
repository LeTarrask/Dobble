//
//  IconView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct IconView: View {
    let image: String
    
    @State var scale: Bool = false
    
    var body: some View {
        // Text(image) - to use when deck is emojis
        // .font(.system(size: CGFloat.random(in: 20..<60)))
        GeometryReader { geo in
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: scale ? geo.size.width : geo.size.width * 0.8)
                .rotationEffect(Angle(degrees: Double.random(in: -90...90)))
                .onTapGesture {
                    scale.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        scale.toggle()
                    }
                }
        }
            
    }
}
