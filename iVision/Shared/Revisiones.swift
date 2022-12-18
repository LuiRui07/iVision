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
    
    
    @State public var idRevision : UUID = UUID()
    @State public var tDate: Date = Date()
    
    @State public var tOd_esfera: String = ""
    @State public var tOd_cilindro : String = ""
    @State public var tOd_adicion : String = ""
    @State public var tOd_agudeza : String = ""
    
    @State public var tOi_esfera : String = ""
    @State public var tOi_cilindro : String = ""
    @State public var tOi_adicion : String = ""
    @State public var tOi_agudeza : String = ""
    
    func getDatos (nif : String) -> [TEye] {
    let request = TEye.fetchRequest() as NSFetchRequest<TEye>
    let pred = NSPredicate(format: "nif == %@", nif)
    request.predicate = pred
    let datos = (try? moc.fetch(request))!
    return datos
    }
    
    func FechaaString (fecha : Date) -> String {
        let s = fecha.ISO8601Format()
        let index = s.firstIndex(of: "T") ?? s.endIndex
        let beginning = s[..<index]
        let newString = String(beginning)
        
        let ar = newString.split(separator: "-")
        let newString2 = String(ar[2] + "/" + ar[1] + "/" + ar[0])

        
        return newString2
    }
    
    func refresco(){  /// QUE COÑO ESTOY HACIENDO
        tOd_esfera = tOd_esfera
        tOd_cilindro  = tOd_cilindro
        tOd_adicion  = tOd_adicion
        tOd_agudeza  = tOd_agudeza
        tOi_esfera  = tOi_esfera
        tOi_cilindro  = tOi_cilindro
        tOi_adicion  = tOi_adicion
        tOi_agudeza  = tOi_agudeza
        tDate = tDate
        idRevision = idRevision
    }
    
    func limpiar(){
        tOd_esfera = ""
        tOd_cilindro  = ""
        tOd_adicion  = ""
        tOd_agudeza  = ""
        tOi_esfera  = ""
        tOi_cilindro  = ""
        tOi_adicion  = ""
        tOi_agudeza  = ""
        tDate = Date.now
    }

    
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
            let datos = getDatos(nif: nifPersona)
            Table(datos) {
               TableColumn("ID"){ dato in
                       Text(dato.id?.uuidString ?? "1")
                           .onTapGesture(count: 1, perform: {
                               tOd_esfera = String(dato.od_esfera)
                               tOd_cilindro = String(dato.od_cilindro)
                               tOd_adicion = String(dato.od_adicion)
                               tOd_agudeza = String(dato.od_agudeza)
                               
                               tOi_esfera = String(dato.oi_esfera)
                               tOi_cilindro = String(dato.oi_cilindro)
                               tOi_adicion = String(dato.oi_adicion)
                               tOi_agudeza = String(dato.oi_agudeza)
                               
                               tDate = dato.consulta!
                               idRevision = dato.id!
                           })
                   }
           }
           .frame(width: 350)
            Table(datos){
                TableColumn("NIF"){ dato in
                           Text(dato.nif ?? "Unknown")
                               .onTapGesture(count: 1, perform: {
                                   tOd_esfera = String(dato.od_esfera)
                                   tOd_cilindro = String(dato.od_cilindro)
                                   tOd_adicion = String(dato.od_adicion)
                                   tOd_agudeza = String(dato.od_agudeza)
                                   
                                   tOi_esfera = String(dato.oi_esfera)
                                   tOi_cilindro = String(dato.oi_cilindro)
                                   tOi_adicion = String(dato.oi_adicion)
                                   tOi_agudeza = String(dato.oi_agudeza)
                                   
                                   tDate = dato.consulta!
                                   idRevision = dato.id!
                               })
                }

               TableColumn("CONSULTA"){ dato in
                          Text(FechaaString(fecha:dato.consulta ?? Date.now))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }
                TableColumn("OD_ESFERA"){ dato in
                          Text(String(dato.od_esfera))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
                      
               }
               TableColumn("OD_CILINDRO"){ dato in
                          Text(String(dato.od_cilindro))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
                      
               }
               TableColumn("OD_ADICION"){ dato in
                          Text(String(dato.od_adicion))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }
               TableColumn("OD_AGUDEZA"){ dato in
                          Text(String(dato.od_agudeza))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }
               TableColumn("OI_ESFERA"){ dato in
                          Text(String(dato.oi_esfera))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }
               TableColumn("OI_CILINDRO"){ dato in
                          Text(String(dato.oi_cilindro))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }
               TableColumn("OI_ADICION"){ dato in
                          Text(String(dato.oi_adicion))
                              .onTapGesture(count: 1, perform: {
                                  tOd_esfera = String(dato.od_esfera)
                                  tOd_cilindro = String(dato.od_cilindro)
                                  tOd_adicion = String(dato.od_adicion)
                                  tOd_agudeza = String(dato.od_agudeza)
                                  
                                  tOi_esfera = String(dato.oi_esfera)
                                  tOi_cilindro = String(dato.oi_cilindro)
                                  tOi_adicion = String(dato.oi_adicion)
                                  tOi_agudeza = String(dato.oi_agudeza)
                                  
                                  tDate = dato.consulta!
                                  idRevision = dato.id!
                              })
               }

                TableColumn("OI_AGUDEZA"){ dato in
                           Text(String(dato.oi_agudeza))
                               .onTapGesture(count: 1, perform: {
                                   tOd_esfera = String(dato.od_esfera)
                                   tOd_cilindro = String(dato.od_cilindro)
                                   tOd_adicion = String(dato.od_adicion)
                                   tOd_agudeza = String(dato.od_agudeza)
                                   
                                   tOi_esfera = String(dato.oi_esfera)
                                   tOi_cilindro = String(dato.oi_cilindro)
                                   tOi_adicion = String(dato.oi_adicion)
                                   tOi_agudeza = String(dato.oi_agudeza)
                                   
                                   tDate = dato.consulta!
                                   idRevision = dato.id!
                               })
                }
                
                }
                .shadow(color: .black, radius:100)
        }
      
    
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
                DatePicker("", selection: $tDate, displayedComponents: [.date])
            Text(tDate, style: .date)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 200)
            
            }
            .frame(width: 400)
            .padding(.leading, 30)
            
        //Botones abajo
            HStack{
            Button("Añadir"){     //NOSEPUEDAÑADIR VACIo
                let eye = TEye (context: moc)
                eye.nif = nifPersona
                eye.id = UUID()
                eye.consulta = tDate
                eye.od_esfera = Double(tOd_esfera) ?? 0
                eye.od_cilindro = Double(tOd_cilindro) ?? 0
                eye.od_adicion = Double(tOd_adicion) ?? 0
                eye.od_agudeza = Double(tOd_agudeza) ?? 0
                eye.oi_esfera = Double(tOi_esfera) ?? 0
                eye.oi_cilindro = Double(tOi_cilindro) ?? 0
                eye.oi_adicion = Double(tOi_adicion) ?? 0
                eye.oi_agudeza = Double(tOi_agudeza) ?? 0
                
                refresco()
                limpiar()
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Limpiar"){
            limpiar()
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Actualizar"){
                for d in getDatos (nif: nifPersona){
                    if d.id == idRevision{
                        if (d.od_esfera != Double(tOd_esfera)){
                            d.od_esfera = Double(tOd_esfera) ?? 0
                        }
                        if (d.od_cilindro != Double(tOd_cilindro)){
                            d.od_cilindro = Double(tOd_cilindro) ?? 0
                        }
                        if (d.od_agudeza != Double(tOd_agudeza)){
                            d.od_agudeza = Double(tOd_agudeza) ?? 0
                        }
                        if (d.od_adicion != Double(tOd_adicion)){
                            d.od_adicion = Double(tOd_adicion) ?? 0
                        }
                        if (d.oi_esfera != Double(tOi_esfera)){
                            d.oi_esfera = Double(tOi_esfera) ?? 0
                        }
                        if (d.oi_cilindro != Double(tOi_cilindro)){
                            d.oi_cilindro = Double(tOi_cilindro) ?? 0
                        }
                        if (d.oi_agudeza != Double(tOi_agudeza)){
                            d.oi_agudeza = Double(tOi_agudeza) ?? 0
                        }
                        if (d.oi_adicion != Double(tOi_adicion)){
                            d.oi_adicion = Double(tOi_adicion) ?? 0
                        }
                        if (d.consulta != tDate){
                            d.consulta = tDate
                        }
                    }
            }
                limpiar()
                try? moc.save()
            }
            .padding(.bottom,70)
            .fixedSize()
            
            Button("Salir"){
            dismiss()
            }
            .padding(.top,70)
            .fixedSize()
            
            Button("Borrar", role: .destructive){
                let datos = getDatos(nif: nifPersona)
                for d in datos{
                    if d.id == idRevision{
                        let index = datos.firstIndex(of: d)
                        let eliminar = datos[index!]
                        moc.delete(eliminar)
                    }
            }
            limpiar()
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
