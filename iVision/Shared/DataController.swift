//
//  DataController.swift
//  iVision
//
//  Created by Luis Ruiz Nuñez on 6/12/22.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores{description, error in if let error = error {
            print("Core Data failed to load: \(error.localizedDescription)")
        }}
        print("Base de Datos Lista!")
    }
    
    
}
