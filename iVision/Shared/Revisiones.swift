//
//  Consultas.swift
//  iVision
//
//  Created by Luis Ruiz Nuñez on 7/12/22.
//

import Foundation
import SwiftUI
import CoreData
    
struct Revisiones: View{
    @Environment(\.managedObjectContext) var moc
    @State public var Tnif: String = "77227286W"
    @State public var TNombre: String = "Luis"
    @State public var TApellidos: String = "Ruiz"
    @State public var TEdad: String = "10"
    @State public var currentDate: Date = Date()
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<TClient>
    @FetchRequest(sortDescriptors: []) var dato: FetchedResults<TEye
    >
    
    var body: some View{
        VStack{
            let Todo =  Tnif + ";" + TNombre + ";" + TApellidos + ";" + TEdad
            Text(Todo)
        }
        .padding()
        .font(.title)
        
        //Tabla
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
            
            VStack{
            HStack{
                Text("OD_ESFERA")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ESFERA")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("OD_CILINDRO")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_CILINDRO")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            
            HStack{
                Text("OD_ADICION")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ADICION")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("OD_AGUDEZA")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_AGUDEZA")
                TextField("11111111A", text: $Tnif)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
                }

                
            }
            .frame(width: 1000)
            .multilineTextAlignment(.leading)
            .padding()
            
            VStack{
            DatePicker("", selection: $currentDate)
            Text(currentDate, style: .date)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 200)
            
            }
            
            
            HStack{
            Button("Añadir"){
                let client = TClient(context: moc)
                client.nif = Tnif
                client.nombre = TNombre
                client.apellidos = TApellidos
                client.edad = Int16(TEdad) ?? 0
                    
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Limpiar"){
                Tnif = ""
                TNombre = ""
                TApellidos = ""
                TEdad = ""
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Actualizar"){
            
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Salir"){
                exit(0)
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Borrar", role: .destructive){
            
            }
            .padding(.bottom,70)
            .fixedSize()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Revisiones()
                .preferredColorScheme(.dark)
                .padding(0.0)
                .environment(\.sizeCategory, .large)
            .previewLayout(.sizeThatFits)
            Revisiones()
                .environment(\.sizeCategory, .large)
            Revisiones()
                .environment(\.sizeCategory, .large)
        }
        }
    }
