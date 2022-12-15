//
//  ContentView.swift
//  Shared
//
//  Created by Luis Ruiz Nuñez on 5/12/22.
//

import SwiftUI
import CoreData

struct Principal: View  {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<TClient>
    @State public var Tnif: String = ""
    @State public var TNombre: String = ""
    @State public var TApellidos: String = ""
    @State public var TEdad: String = ""
    @State private var navigated = false
    @State private var esta = false
    
    var body: some View {
        //Titulo
        Text("Revisión Ocular")
            .padding()
            .font(.title)

        //Tabla
           Table(clients) {
               TableColumn("NIF"){ client in
                   Text(client.nif ?? "Unknown")
                       .onTapGesture(count: 1, perform: {
                           TNombre = client.nombre ?? ""
                           Tnif = client.nif ?? ""
                           TApellidos = client.apellidos ?? ""
                           TEdad = String(client.edad)
                       })
               }
               TableColumn("Nombre"){ client in
                   Text(client.nombre ?? "Unknown")
                       .onTapGesture(count: 1, perform: {
                           TNombre = client.nombre ?? ""
                           Tnif = client.nif ?? ""
                           TApellidos = client.apellidos ?? ""
                           TEdad = String(client.edad)
                       })
               }
               TableColumn("Apellidos"){ client in
                   Text(client.apellidos ?? "Unknown")
                       .onTapGesture(count: 1, perform: {
                           TNombre = client.nombre ?? ""
                           Tnif = client.nif ?? ""
                           TApellidos = client.apellidos ?? ""
                           TEdad = String(client.edad)
                       })
               }
               TableColumn("Edad"){ client in
                   Text(String(client.edad))
                       .onTapGesture(count: 1, perform: {
                           TNombre = client.nombre ?? ""
                           Tnif = client.nif ?? ""
                           TApellidos = client.apellidos ?? ""
                           TEdad = String(client.edad)
                       })
               }
        }
       .shadow(color: .black, radius:100)
       .listStyle(InsetListStyle())
        
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
                Revisiones(nifPersona: Tnif, nombrePersona: TNombre, apellidosPersona: TApellidos, edadPersona: TEdad)
            }
            
        }
        }
        .frame(width: 1000)
        .multilineTextAlignment(.leading)
        .padding()

        //Botones abajo
        HStack{
            Button("Añadir"){
            esta = false
            for c in clients{
                    if c.nif == Tnif{
                        esta = true
                    }
            }
            if (esta == false){
                let client = TClient(context: moc)
                client.nif = Tnif
                client.nombre = TNombre
                client.apellidos = TApellidos
                client.edad = Int16(TEdad) ?? 0
            }
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
