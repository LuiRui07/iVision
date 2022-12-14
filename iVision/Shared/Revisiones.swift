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
    
    
    @State public var tDate: Date = Date()
    @State public var tOd_esfera: String = ""
    @State public var tOd_cilindro : String = ""
    @State public var tOd_adicion : String = ""
    @State public var tOd_agudeza : String = ""
    
    @State public var tOi_esfera : String = ""
    @State public var tOi_cilindro : String = ""
    @State public var tOi_adicion : String = ""
    @State public var tOi_agudeza : String = ""
    
    
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
                   Button(""){
                       tOd_esfera = String(datos.od_esfera)
                       tOd_cilindro = String(datos.od_cilindro)
                       tOd_adicion = String(datos.od_adicion)
                       tOd_agudeza = String(datos.od_agudeza)
                       
                       tOi_esfera = String(datos.oi_esfera)
                       tOi_cilindro = String(datos.oi_cilindro)
                       tOi_adicion = String(datos.oi_adicion)
                       tOi_agudeza = String(datos.oi_agudeza)
                       tDate = datos.consulta ?? Date.now
                   }
                   Text(datos.id?.uuidString ?? "1") /// WTF
                       .padding()
                   Text(datos.nif ?? "Unknown")
                       .padding()
                  // Text (datos.consulta) // Putas fechas
                  //     .padding()      //
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
                   //Text(String(datos.oi_agudeza))   ///SE ralla porque hay muchos elementos
                      // .padding()
               }
            }
    }
       .shadow(color: .black, radius:100)
    
        //Cuadros de Texto
            VStack{
            HStack{
                Text("OD_ESFERA")
                TextField(" ", text: $tOd_esfera)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ESFERA")
                TextField(" ", text: $tOi_esfera)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
                    
            }
            
            HStack{
                Text("OD_CILINDRO")
                TextField(" ", text: $tOd_cilindro)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_CILINDRO")
                TextField(" ", text: $tOi_cilindro)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            
            HStack{
                Text("OD_ADICION")
                TextField(" ", text: $tOd_adicion)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_ADICION")
                TextField(" ", text: $tOi_adicion)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack{
                Text("OD_AGUDEZA")
                TextField(" ", text: $tOd_agudeza)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                
                Text("OI_AGUDEZA")
                TextField(" ", text: $tOi_agudeza)
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
                }

                
            }
            .frame(width: 1000)
            .multilineTextAlignment(.leading)
            .padding()
        
        
        HStack{
            
        //Calendario
            VStack{
            DatePicker("", selection: $tDate)
            Text(tDate, style: .date)
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
                eye.consulta = tDate
                eye.od_esfera = Double(tOd_esfera) ?? 0
                eye.od_cilindro = Double(tOd_cilindro) ?? 0
                eye.od_adicion = Double(tOd_adicion) ?? 0
                eye.od_agudeza = Double(tOd_agudeza) ?? 0
                eye.oi_esfera = Double(tOi_esfera) ?? 0
                eye.oi_cilindro = Double(tOi_cilindro) ?? 0
                eye.oi_adicion = Double(tOi_adicion) ?? 0
                eye.oi_agudeza = Double(tOi_agudeza) ?? 0
                    
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Limpiar"){
                tOd_esfera = ""
                tOd_cilindro  = ""
                tOd_adicion  = ""
                tOd_agudeza  = ""
                tOi_esfera  = ""
                tOi_cilindro  = ""
                tOi_adicion  = ""
                tOi_agudeza  = ""
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
            for index in datos.indices{        //BOrra todo ahora mismo
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
