//
//  IconView.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import SwiftUI

struct IconView: View {
    let image: String
    
    var body: some View {
        // Text(image) - to use when deck is emojis
        // .font(.system(size: CGFloat.random(in: 20..<60)))
        GeometryReader { geo in
            Image(image)
                .resizable()
                .scaledToFit()
//                .frame(width: (geo.size.width*Double.random(in: 0.5...1.0)))
                .rotationEffect(Angle(degrees: Double.random(in: -90...90)))
        }
            
    }
}
