//
//  ListaDeAtividadesCard.swift
//  FisioDance
//
//  Created by mcor on 11/04/23.
//

import SwiftUI

let feedbackManager = FeedbackManager.shared

struct ListaDeAtividadesCard: View {
    let exercicio: Exercicios
    var body: some View {
        ZStack{
            Image(exercicio.background)
                .resizable()
                .scaledToFit()
                .frame(width: 721,height: 268)
            HStack {
                Image(exercicio.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260,height: 220)
                
                Spacer()
                    .frame(width: 40)
                
                VStack{
                    Text(exercicio.title)
                        .font(.custom("Jura", size: 32))
                        .foregroundColor(Color("dark-blue90"))
                    Text("Duração: \(exercicio.duration)")
                        .font(.custom("Jura", size: 22))
                        .foregroundColor(Color("dark-blue90"))
                    Text(exercicio.subtitle)
                        .font(.custom("Jura", size: 20))
                        .foregroundColor(Color("dark-blue90"))
                    
                    HStack{
                        Button(action: {
                            //action here
                        }){
                            ZStack{
                                Image("preview-button")
                                Text("preview")
                                    .font(.custom("Jura", size: 28))
                                    .foregroundColor(Color("dark-blue90"))
                                    .padding(.bottom)
                                    .padding(.trailing, 40)
                                
                            }
                        }
                        Spacer()
                        
                            ZStack {
                                if feedbackManager.feedback?.emoji != "" {
                                    Image("fav-icon")
                                }
                                
                                Text(feedbackManager.feedback?.emoji ?? "")
                                    .padding(.bottom, 5)
                                    .padding(.trailing,5)
                                    .font(.custom("Jura", size: 26))
                            } .padding(.bottom,7)
                        //}
                       
                    }
                }
                .frame(width: 362,height: 225, alignment: .leading)
                
            }
            .padding(.leading,32)
            .padding(.trailing,34)
            .padding(.top,32)
            .padding(.bottom,34)
            
        }
        
    }
}

struct ListaDeAtividadesCard_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeAtividadesCard(exercicio: Exercicios(title: "Aquecimento", duration: "8 minutos", subtitle: "Uma prática leve e rápida para começar o dia bem!", image: "Mask group card", background: "Cell-model-1", emoji: ""))
    }
}
