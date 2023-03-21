//
//  EndGameView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct EndGameView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: GamesListView()){
                    Text("Ir para a lista")
                        .padding(20)
                }
                
                NavigationLink(destination: GameView()){
                    Text("Jogar de novo")
                }
            }
        }
        .navigationTitle("Fim de jogo")
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
