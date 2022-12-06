//
//  ContentView.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<TClient>
    
    var body: some View {
        Text("Revisión Ocular")
            .padding()
            .font(.title)
        VStack {
            List(clients) { client in
                Text(client.nombre ?? "Unknown")
        }
            
            Button("Añadir"){
                let client = TClient(context: moc)
                client.nombre = "Luis"
                    
                try? moc.save()
            }
            
            Button("Actualizar"){

            }
            .position(x: 175, y: 100)
            
            Button("Borrar"){

            }
            
            Button("Limpiar"){

            }
            
            Button("Salir"){

            }
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
