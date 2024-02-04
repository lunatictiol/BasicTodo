//
//  ContentView.swift
//  Todo
//
//  Created by sabiq on 04/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var todoList: TodoList = TodoList()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(todoList.todos) { todo in
                        HStack{
                            Text(todo.Task)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    todoList.delete(todo: todo)
                                }
                        }
                    }
                }
            }.navigationTitle("Todo List")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            todoList.showTodoView.toggle()
                        }, label: {
                            Text("Add Todos")
                        })
                    }
                }.sheet(isPresented: $todoList.showTodoView, 
                        content: {
                   AddTodoView(todoList: todoList)
                })
        }
        
    }
}
struct Todo:Identifiable,Equatable{
    var id = UUID()
    var Task : String
}
class TodoList: ObservableObject{
    @Published var todos:[Todo] = []
    @Published var showTodoView = false
    
    func addTodo(task:String){
        todos.append(Todo(Task: task))
    }
    func delete(todo:Todo){
        if let index = todos.firstIndex(of: todo){
            todos.remove(at: index)
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
