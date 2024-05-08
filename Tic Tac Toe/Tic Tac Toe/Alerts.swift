//
//  Alerts.swift
//  Tic Tac Toe
//
//  Created by Carson Lawrence on 5/6/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    var buttinTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                                    message: Text("You beat the computer!"),
                                    buttinTitle: Text("Play Again"))
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                       message: Text("The computer beat you!"),
                                       buttinTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw!"),
                                message: Text("You and the computer came to a draw!"),
                                buttinTitle: Text("Try Again"))
}
