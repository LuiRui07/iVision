//
//  iVisionApp.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI

@main
struct iVisionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           // ContentView()
              //  .environment(\.managedObjectContext, //persistenceController.container.viewContext)
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)

        }
    }
}
