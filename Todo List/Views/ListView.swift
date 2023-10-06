//
//  ListView.swift
//  Todo List
//
//  Created by Mohamed Saad on 05/10/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "first item",
        "second item",
        "third item"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item  in
                ListRowView(title: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Todo List 📝"))
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()) )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


