//
//  AddTodoView.swift
//  Todo
//
//  Created by sabiq on 04/02/24.
//

import SwiftUI

struct AddTodoView: View {
    @State private var task = ""
    @State private var displayText = "What do you want to add?"
    @ObservedObject var todoList: TodoList
    var body: some View {
        NavigationView{
            VStack{
                RoundedRectangle(cornerRadius: 15 )
                    .frame(width: 300,height: 50)
                    .shadow(color:.gray,radius: 5,x: 0,y: 5)
                    .foregroundColor(.white)
                    .overlay {
                        TextField(displayText, text: $task)
                            .multilineTextAlignment(.center)
                        
                    }
                Button(action: {
                    if task != ""{
                        todoList.addTodo(task: task)
                        todoList.showTodoView = false
                        
                    }
                    else{
                        displayText = "Enter a Task First"
                    }
                    
                    
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 15 )
                        .frame(width: 300,height: 50)
                        .foregroundColor(.blue)
                        .overlay {
                            Text("Add")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .bold()
                                .font(.title2)
                            
                        }
                }).padding()
              Spacer()
                
            }.navigationTitle("ADD TODO 📝")
                .padding(.top,30)
                
        }
        
    }
}

#Preview {
    AddTodoView(todoList: TodoList())
}
