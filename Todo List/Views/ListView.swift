//
//  ListView.swift
//  Todo List
//
//  Created by Mohamed Saad on 05/10/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            }else{
                List {
                    ForEach(listViewModel.items) { item  in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                    
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .environmentObject(ListViewModel())
    }
}


