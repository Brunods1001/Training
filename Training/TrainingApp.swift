//
//  TrainingApp.swift
//  Training
//
//  Created by Bruno dos Santos on 9/4/23.
//

import SwiftUI

@main
struct TrainingApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
