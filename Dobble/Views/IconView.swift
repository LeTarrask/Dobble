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
        Image(image)
            .resizable()
            .scaledToFit()
            
    }
}
