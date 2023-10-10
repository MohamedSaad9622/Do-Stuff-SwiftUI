//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Mohamed Saad on 05/10/2023.
//

import SwiftUI

@main
struct Todo_ListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
