//
//  IVisionApp2.swift
//  iVision
//
//  Created by Luis Ruiz Nuñez on 9/12/22.
//

import Foundation
//
//  iVisionApp.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI

@main
struct iVisionApp2: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
           Revisiones()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
