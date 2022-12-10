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
    private var c = false

    var body: some Scene {
        WindowGroup {
           Revisiones()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
