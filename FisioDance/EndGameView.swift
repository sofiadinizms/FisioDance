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
            ZStack{
                
                Rectangle()
                    .foregroundColor(Color("light-blue10"))
                    .cornerRadius(12)
                    .frame(width: 725, height: 763, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("dark-blue90"), lineWidth: 2)
                    )
                
                
                VStack{
                    Image("Mask group")
                    VStack{
                        HStack{
                            Text("Nome da Conduta")
                                .foregroundColor(Color("dark-blue90"))
                                .font(.custom("Jura", size: 39))
                        }
                        .frame(width: 665,height: 46)
                        
                        
                        HStack{
                            Text("E aí, o que que achou dessa prática? Classifique o grau de dificuldade para que a gente possa aperfeiçoar nossas ofertas pra você!")
                                .foregroundColor(Color("dark-blue90"))
                                .font(.custom("Jura", size: 24))
                        }
                        .frame(width: 665, height: 96)
                        
                        
                        HStack{
                            UserFeedbackView()
                        }
                        
                        .frame(width: 665, height: 74)
                        
                        
                        
                        HStack{
                            
                            Button(action: {
                                //action here
                            }) {
                                NavigationLink(destination: GameView()){
                                    HStack {
                                        Text("Repetir")
                                        Image(systemName: "gobackward")
                                            .padding()
                                        
                                    }
                                }
                            }
                            
                            .buttonStyle(.borderedProminent)
                            .tint(Color("light-blue10"))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("dark-blue90"), lineWidth: 2))
                            .foregroundColor(Color("dark-blue90"))
                            .font(.custom("Jura", size: 15))
                            .foregroundColor(Color("dark-blue90"))
                            
                            Spacer()
                            
                            Button(action: {
                                //action here
                            }) {
                                NavigationLink(destination: GamesListView()){
                                    HStack {
                                        Text("Menu")
                                        Image(systemName: "list.bullet")
                                            .padding()
                                        
                                        
                                    }
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color("light-blue30"))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color("dark-blue90"), lineWidth: 2))
                            .font(.custom("Jura", size: 15))
                            .foregroundColor(Color("dark-blue90"))
                            
                            
                        }
                        .frame(width:665,height: 70)
                        
                        
                    }
                    
                    .frame(width: 665,height: 370)
                    
                }
            }
        }
        
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
