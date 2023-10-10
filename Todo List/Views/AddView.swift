//
//  AddView.swift
//  Todo List
//
//  Created by Mohamed Saad on 05/10/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Add something here...", text: $textFieldText)
                    .foregroundColor(Color.white)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button {
                    saveButtonAction()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
//                        .font(.title)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(15)
        }
        .navigationTitle(Text("Add new item 🖋"))
        .alert(isPresented: $showAlert, content: getAlert )
    }
    
    func saveButtonAction(){
        if textAppropriate() {
            listViewModel.add(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textAppropriate() -> Bool {
        showAlert = !(textFieldText.count > 3)
        alertTitle = "your new todo item must be at least 3 characters long!!! 😱😱😱"
        return textFieldText.count > 3
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
