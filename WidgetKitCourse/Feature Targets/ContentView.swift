//
//  ContentView.swift
//  WidgetKitCourse
//
//  Created by Florian Schweizer on 01.12.21.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Todo] = []
    @State var selectedTodo: Todo?
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                Button {
                    selectedTodo = todo
                } label: {
                    Text("\(todo.title): **\(todo.completed ? "completed" : "open")**")
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("My Todos")
            .task {
                do {
                    todos = try await TodoService.shared.getAllTodos()
                } catch {
                    print(error)
                }
            }
            .sheet(item: $selectedTodo) { todo in
                GroupBox {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.headline)
                        
                        Text(todo.completed ? "Completed" : "Open")
                            .font(.subheadline)
                    }
                } label: {
                    Label("Todo #\(todo.id)", systemImage: "person")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
