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
    @State private var Tnif: String = ""
    @State private var TNombre: String = ""
    @State private var TApellidos: String = ""
    @State private var TEdad: String = ""
    
    
    var body: some View {
        Text("Revisión Ocular")
            .padding()
            .font(.title)
        //Tabla
        VStack {
            List(clients) { client in
                Text(client.nif ?? "Unknown")
                Text(client.nombre ?? "Unknown")
                Text(client.apellidos ?? "Unknown")
                Text(String(client.edad))
        }
    }
        .shadow(radius: 100)
        
        VStack{
        HStack{
            Text("NIF")
            TextField("11111111A", text: $Tnif)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        
        HStack{
            Text("Nombre")
            TextField("Nombre1", text: $TNombre)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        
        
        HStack{
            Text("Apellidos")
            TextField("Apellidos1", text: $TApellidos)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        
        HStack{
            Text("Edad")
            TextField("", text: $TEdad)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
    
            Button("Revisiones"){

            }
            
        }
        }
        .multilineTextAlignment(.leading)


        //Botones abajo
        HStack{
            Button("Añadir"){
                let client = TClient(context: moc)
                client.nif = Tnif
                client.nombre = TNombre
                client.apellidos = TApellidos
                client.edad = Int16(TEdad) ?? 0
                    
                try? moc.save()
            }
            .padding(10)
            .fixedSize()

            Button("Actualizar"){
            
            }
            .padding(10)
            .fixedSize()
            
            Button("Borrar", role: .destructive){

            }
            .padding(10)
            .fixedSize()
            
            Button("Limpiar"){

            }
            .padding(10)
            .fixedSize()
            
            Button("Salir"){

            }
            .padding(10)
            .fixedSize()

            
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .padding(0.0)
                .environment(\.sizeCategory, .large)
            .previewLayout(.sizeThatFits)
            ContentView()
                .preferredColorScheme(.dark)
        }
        }
    }
}
