//
//  GamesListView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct GamesListView: View {
    var body: some View {
            VStack{
                NavigationLink(destination: ContentView()){
                    Text("Voltar para Home")
                        .padding(20)
                }
//                NavigationLink(destination: GameView()){
//                    Text("Jogar (selecionou o exercício)")
//                }
            }

            
        .navigationTitle("Lista de exercícios")
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
