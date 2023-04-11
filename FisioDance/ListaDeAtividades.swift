//
//  ListaDeAtividades.swift
//  FisioDance
//
//  Created by mcor on 11/04/23.
//

import SwiftUI

//let feedbackManager = FeedbackManager.shared

struct Exercicios: Hashable {
    let title: String
    let duration: String
    let subtitle: String
    let image: String
    let background: String
    let emoji: String
   
}



struct ListaDeAtividades: View {
    
    
    private let row: [GridItem] = [
    GridItem(.fixed(280)),
    GridItem(. fixed (280)),
    ]
    
    let exercicios = [
     Exercicios(title: "Vamos aquecer!", duration: "6 minutos", subtitle: "Uma prática leve e rápida para começar o dia bem!", image: "Mask group card", background: "Cell-model-2", emoji: "\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Alongamento simples", duration: "10 minutos", subtitle: "Libere as articulações dos pulsos e dos dedos com esses movimentos!", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Muita energia", duration: "6 minutos", subtitle: "Exercícios mais intensos que preparam para atividades de alto esforço.", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Estica e puxa", duration: "8 minutos", subtitle: "Prepare suas articulações para realizar movimentos repetitivos.", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Força!", duration: "8 minutos", subtitle: "Aquecimento para atividades que demandam resistência muscular.", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Libera geral", duration: "10 minutos", subtitle: "Movimentos que ajudam no relaxamento de tensão nas articulações do pulso", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Break-fast", duration: "5 minutos", subtitle: "Uma pausa no expediente para exercícios que ajudarão a manter o ritmo.", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")"),
     Exercicios(title: "Dedos soltos", duration: "10 minutos", subtitle: "Exercícios que promovem a saúde das articulações dos dedos", image: "Mask group card", background: "Cell-model-1", emoji:"\(feedbackManager.feedback?.emoji ?? "")")
     
     
     ]
    
    var body: some View {
        HStack(alignment: .center) {
            ScrollView(.horizontal) {
                LazyHGrid( rows: row
//                spacing: 10
                ) {
                    ForEach(exercicios, id: \.self) { item in
                        ListaDeAtividadesCard(exercicio: Exercicios(title: item.title, duration: item.duration, subtitle: item.subtitle, image: item.image, background: item.background, emoji: item.emoji))
                            .frame(height: 80)
                    }
                    
                }
                
                .padding()
            }
        }
        .border(.black)
        .frame(height: 556)
    }
}

struct ListaDeAtividades_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeAtividades()
    }
}
