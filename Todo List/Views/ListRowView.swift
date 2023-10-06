//
//  ListRowView.swift
//  Todo List
//
//  Created by Mohamed Saad on 05/10/2023.
//

import SwiftUI

struct ListRowView: View {
    
    var title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is the first title")
    }
}
