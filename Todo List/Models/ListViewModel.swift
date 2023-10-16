//
//  ListViewModel.swift
//  Todo List
//
//  Created by Mohamed Saad on 08/10/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    var itemsKey = "itemsKey"
    
    init() {
        getItems()
    }
    
    func getItems(){
       
        guard
            let data = UserDefaults.standard.value(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data as! Data)
        else { return }
        
        items = decodedData
    }
    
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func add(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
