//
//  ContentView.swift
//  WidgetKitCourse
//
//  Created by Florian Schweizer on 01.12.21.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Todo] = []
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                Text("\(todo.title): **\(todo.completed ? "completed" : "open")**")
            }
            .navigationTitle("My Todos")
            .task {
                do {
                    todos = try await TodoService.shared.getAllTodos()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
