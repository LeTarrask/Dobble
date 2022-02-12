//
//  LoadingView.swift
//  Dobble
//
//  Created by tarrask on 12/02/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .scaledToFill()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
