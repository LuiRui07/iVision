//
//  iVisionApp.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI

@main
struct iVisionApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
           ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
