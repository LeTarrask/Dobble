//
//  KawaiiDeckView.swift
//  Dobble
//
//  Created by tarrask on 12/02/2022.
//

import SwiftUI

struct KawaiiDeckView: View {
    @State var deck = numberDeck()
    
    var body: some View {
        Image(deck.cards[0].images[0]).resizable().scaledToFit()
    }
}

struct KawaiiDeckView_Previews: PreviewProvider {
    static var previews: some View {
        KawaiiDeckView()
    }
}
