//
//  GameView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: GamesListView()){
                    Text("Desistir e voltar pra lista")
                        .padding(20)
                }
                
                NavigationLink(destination: EndGameView()){
                    Text("Concluir partida")
                }
                
            }
            
        }
        .navigationTitle("Game play")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
