//
//  PlayButton.swift
//  Tic Tac Toe
//
//  Created by Carson Lawrence on 5/7/24.
//

import SwiftUI

struct PlayButtonView: View {
    var body: some View {
        NavigationView{
            Button {
                
            } label: {
                NavigationLink("Press Play", destination: GameView())
            }
            .frame(width:200, height: 200, alignment: .center)
            .background(.green)
            .foregroundColor(.yellow)
            .font(.largeTitle)
            .clipShape(Circle())
            .shadow(radius: 15)
            .navigationTitle("Tic-Tac-Toe")
        }
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView()
    }
}
