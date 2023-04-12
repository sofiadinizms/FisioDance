//
//  ContentView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{

            VStack {
                NavigationLink(destination: ListaDeAtividades()){
                    Text("Play")
                        .padding(20)
                }
                
                NavigationLink(destination: HelpView()){
                    Text("Ajuda")
                }
            }
            
        }
        .navigationTitle("Home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
