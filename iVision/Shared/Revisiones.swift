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
    @Environment(\.dismiss) var dismiss
    @State public var nifPersona: String
    @State public var nombrePersona: String
    @State public var apellidosPersona: String
    @State public var edadPersona: String
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
            let Todo =  nifPersona + ";" + nombrePersona + ";" + apellidosPersona + ";" + edadPersona
            Text(Todo)
        }
        .padding()
        .font(.title)
        
        //Tabla
        HStack{
          Text("ID")
          Text("NIF")
          Text("CONSULTA")
          Text("OD_ESFERA")
          Text("OD_CILINDRO")
          Text("OD_ADICION")
          Text("OD_AGUDEZA")
        }
        .padding(.trailing, 750)
        
       VStack {
           List(datos) { datos in
               HStack{
                   Text(datos.id?.uuidString ?? "1")
                       .padding()
                   Text(datos.nif ?? "Unknown")
                       .padding()
                   // Text (datos.consulta) no va
                    //   .padding()
                   Text(String(datos.od_esfera))
                       .padding()
                   Text(String(datos.od_cilindro))
                       .padding()
                   Text(String(datos.od_adicion))
                       .padding()
                   Text(String(datos.od_agudeza))
                       .padding()
                   Text(String(datos.oi_esfera))
                       .padding()
                   Text(String(datos.oi_cilindro))
                       .padding()
                   Text(String(datos.oi_adicion))
                       .padding()
                   Text(String(datos.oi_agudeza))
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
                let eye = TEye (context: moc)
                eye.nif = nifPersona
               //eye.id =
                eye.consulta = currentDate
                eye.od_esfera = Double(Od_esfera) ?? 0
                eye.od_cilindro = Double(Od_cilindro) ?? 0
                eye.od_adicion = Double(Od_adicion) ?? 0
                eye.od_agudeza = Double(Od_agudeza) ?? 0
                eye.oi_esfera = Double(Oi_esfera) ?? 0
                eye.oi_cilindro = Double(Oi_cilindro) ?? 0
                eye.oi_adicion = Double(Oi_adicion) ?? 0
                eye.oi_agudeza = Double(Oi_agudeza) ?? 0
                    
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Limpiar"){
                Od_esfera = ""
                Od_cilindro  = ""
                Od_adicion  = ""
                Od_agudeza  = ""
                Oi_esfera  = ""
                Oi_cilindro  = ""
                Oi_adicion  = ""
                Oi_agudeza  = ""
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Actualizar"){
            //TODO
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Salir"){
            dismiss()
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Borrar", role: .destructive){
            for index in datos.indices{
                let eliminar = datos[index]
                moc.delete(eliminar)
                }
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            
            }
            .padding(.leading,100)
        }
        .padding(.trailing,20)
    }
}

/*
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
*/
