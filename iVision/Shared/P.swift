//
//  P.swift
//  iVision
//
//  Created by Luis Ruiz Nuñez on 9/12/22.
//


import SwiftUI

var clients = [10,11]


struct ContentView : View {
    var body: some View {
        NavigationView {
                //Tabla
               VStack {
                    Text("Hola")
                   Text("Hola")
                   Text("Hola")
                   Text("Hola")
            }
               .shadow(color: .black, radius:100)
                Text("Hello World")
                NavigationLink(destination: Principal()) {
                    Text("Do Something")
                }
            }
        }
    }
