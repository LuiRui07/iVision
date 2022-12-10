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
    
    @State public var Od_esfera: String = ""
    @State public var Od_cilindro : String = ""
    @State public var Od_adicion : String = ""
    @State public var Od_agudeza : String = ""
    
    @State public var Oi_esfera : String = ""
    @State public var Oi_cilindro : String = ""
    @State public var Oi_adicion : String = ""
    @State public var Oi_agudeza : String = ""
    
    
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<TClient>
    @FetchRequest(sortDescriptors: []) var datos: FetchedResults<TEye>
    
    var body: some View {
        //Titulo
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
    
        //Cuadros de Texto
            VStack{
            HStack{
                Text("OD_ESFERA")
                TextField(" ", text: $Od_esfera)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ESFERA")
                TextField(" ", text: $Oi_esfera)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
            }
            
            HStack{
                Text("OD_CILINDRO")
                TextField(" ", text: $Od_cilindro)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_CILINDRO")
                TextField(" ", text: $Oi_cilindro)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            
            HStack{
                Text("OD_ADICION")
                TextField(" ", text: $Od_adicion)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ADICION")
                TextField(" ", text: $Oi_adicion)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("OD_AGUDEZA")
                TextField(" ", text: $Od_agudeza)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_AGUDEZA")
                TextField(" ", text: $Oi_agudeza)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
                }

                
            }
            .frame(width: 1000)
            .multilineTextAlignment(.leading)
            .padding()
        HStack{
        //Calendario mas bugeao que mi abuela
            VStack{
            DatePicker("", selection: $currentDate)
            Text(currentDate, style: .date)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 200)
            
            }
            .frame(width: 400)
            .padding(.leading, 30)
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
            //TODO
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Salir"){
                exit(0)
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Borrar", role: .destructive){
            //TODO
            }
            .padding(.bottom,70)
            .fixedSize()
            
            
            }
            .padding(.leading,100)
        }
        .padding(.trailing,20)
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
