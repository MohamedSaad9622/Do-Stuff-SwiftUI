//
//  NoItemsView.swift
//  Todo List
//
//  Created by Mohamed Saad on 11/10/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    var secondaryColor = Color("secondaryColor")
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items")
                    .font(.title)
                .fontWeight(.semibold)
                
                Text("Are you productive person? I think you should click the add button and add a bunch of items to your todo list")
                    .padding()
//                    .padding(20)
                NavigationLink (
                    destination:   AddView(),
                label: {
                    Text("Add SomeThing 🥳")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background( animate ? Color.blue : Color.red)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.2 : 1 )
                .offset(y: animate ? -10 : 0)
                .shadow(color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
           
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation(){
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle(Text("Title"))
        }
    }
}
