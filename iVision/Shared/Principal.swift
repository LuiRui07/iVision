//
//  ContentView.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI
import CoreData

class UserOcular {
    var Nif: String
    var Nombre : String
    var Apellidos : String
    var Edad : String
    
    init(){
    Nif = ""
    Nombre = ""
    Apellidos = ""
    Edad = ""
    }
}

struct Principal: View  {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<TClient>
    @State var us = UserOcular()
    @State public var Tnif: String = ""
    @State public var TNombre: String = ""
    @State public var TApellidos: String = ""
    @State public var TEdad: String = ""
    @State private var navigated = false
    
    var body: some View {
        //Titulo
        Text("Revisión Ocular")
            .padding()
            .font(.title)
        
        //Tabla
        HStack{
          Text("NIF")
          Text("Nombre")
          Text("Apellidos")
          Text("Edad")
        }
        .padding(.trailing, 750)
        
       VStack {
           List(clients) { client in
                HStack{
                Text(client.nif ?? "Unknown")
                       .padding()
                Text(client.nombre ?? "Unknown")
                       .padding()
                Text(client.apellidos ?? "Unknown")
                       .padding()
                Text(String(client.edad))
                       .padding()
               }
            }
    }
       .shadow(color: .black, radius:100)
        
        //Cuadros de Texto
        VStack{
        HStack{
            Text("NIF")
            TextField("11111111A", text: $Tnif)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.trailing,75)
        
        HStack{
            Text("Nombre")
            TextField("Nombre1", text: $TNombre)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.trailing,103)
        
        HStack{
            Text("Apellidos")
            TextField("Apellidos1", text: $TApellidos)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.trailing,112)
        
        HStack{
            Text("Edad")
            TextField("", text: $TEdad)
                .frame(width: 400)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                self.navigated.toggle()
            }, label: {
            Text("Revisiones")
            })
            .sheet(isPresented: $navigated){
                Revisiones()
            }
            //Conecta con revisiones
            
        }
        }
        .frame(width: 1000)
        .multilineTextAlignment(.leading)
        .padding()

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
                for c in clients{
                    if c.nif == Tnif{
                        if c.nombre != TNombre{
                            c.nombre = TNombre
                        }
                        if c.apellidos != TApellidos{
                            c.apellidos = TApellidos
                        }
                        if c.edad != Int16(TEdad){
                            c.edad = Int16(TEdad)!
                        }
                    }
            }
                try? moc.save()
            }
            .padding(10)
            .fixedSize()
            
            Button("Borrar", role: .destructive){
                for c in clients{
                    if c.nif == Tnif{
                        let index = clients.firstIndex(of: c)
                        let eliminar = clients[index!]
                        moc.delete(eliminar)
                    }
            }
                try? moc.save()
            }
            .padding(10)
            .fixedSize()
            
            Button("Limpiar"){
                TNombre = ""
                Tnif = ""
                TApellidos = ""
                TEdad = ""
            }
            .padding(10)
            .fixedSize()
            
            Button("Salir"){
                exit(0)
            }
            .padding(10)
            .fixedSize()

            
            
            }
        
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Principal()
                .preferredColorScheme(.dark)
                .padding(0.0)
                .environment(\.sizeCategory, .large)
            .previewLayout(.sizeThatFits)
            Principal()
                .environment(\.sizeCategory, .large)
            Principal()
                .environment(\.sizeCategory, .large)
        }
        }
    }
}
