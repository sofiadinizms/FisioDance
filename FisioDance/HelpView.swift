//
//  HelpView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct HelpView: View {
    
    @State private var items = HelpItems.exampleData
    @State private var selection: HelpItems?
    
    var body: some View {
        NavigationSplitView(){
            List(items, selection: $selection) { item in
                Text(item.name).tag(item)
                    .font(.custom("Kite One", size: 24))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
            }
            .background{
                Color(red: 10/255, green: 132/255, blue: 178/255)
                Image("background-sidebar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
            .scrollContentBackground(.hidden)
            //.navigationTitle("Ajuda") //-> nessa posição, o título fica em cima da sidebar.
        } detail: {
            if let selected = selection {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(selected.details)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .font(.custom("Jura", size: 26))
                            .foregroundColor(Color(red: 10/255, green: 132/255, blue: 178/255))
                            .fontWeight(.bold)
                    }
                }
                .navigationBarTitle(selected.name)
                
            } else {
                Text("Escolha ao lado")
                    .navigationTitle("")
                    .font(.custom("Jura", size: 18))
                    .foregroundColor(Color(red: 10/255, green: 132/255, blue: 178/255))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 600, leading: 0, bottom: 600, trailing: 0))
                //ScrollView tá pegando espaço do título da detail, deixando ele alinhado centralmente e com a fonte menor. Tá deixando o texto "Escolha ao lado" na parte central superior da tela. Sem a ScrollView, a cor do background não fica inteira no fundo, somente na linha do texto "Escolha ao lado".
                //<padding(EdgeInsets)> resolveu o problema.
                    .background(Color(red: 215/255, green: 244/255, blue: 1))
            }
        }
        .navigationTitle("Ajuda") //nessa posição, o título fica no centro superior da detail.
        .accentColor(Color(red: 215/255, green: 244/255, blue: 1))
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

struct HelpItems: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: String
}

extension HelpItems {
    static var exampleData: [HelpItems] {
        [
            .init(name: "Título 1", details: "Infos da página de Título 1"),
            .init(name: "Título 2", details: "Infos da página de Título 2"),
            .init(name: "Título 3", details: "Infos da página de Título 3"),
        ]
    }
}
