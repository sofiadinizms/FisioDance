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
        NavigationSplitView{
            List(items, selection: $selection) { item in
                Text(item.name).tag(item)
            }
        } detail: {
            Text(selection?.details ?? "Escolha ao lado")
                .navigationTitle(selection?.name ?? "")
            
        }
        .navigationTitle("Ajuda")
        .navigationSplitViewStyle(.balanced)
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
