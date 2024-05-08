//
//  Tic_Tac_ToeApp.swift
//  Tic Tac Toe
//
//  Created by Carson Lawrence on 5/6/24.
//

import SwiftUI

@main
struct Tic_Tac_ToeApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                PlayButtonView()
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
