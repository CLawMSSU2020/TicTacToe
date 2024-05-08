//
//  GameView.swift
//  Tic Tac Toe
//
//  Created by Carson Lawrence on 5/6/24.
//

import SwiftUI
import CoreData

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttinTitle, action: { viewModel.resetGame() }))
            })
        }
    }
}

enum Player{
    case human, computer
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.green).opacity(1)
            .frame(width:proxy.size.width/3 - 15 , height: proxy.size.width/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    @State private var isAnimating = false
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.yellow)
            .scaleEffect(isAnimating ? 1.5 : 1.0)
            .onAppear() {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }
    }
}
