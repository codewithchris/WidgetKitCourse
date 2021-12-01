//
//  TodoService.swift
//  WidgetKitCourse
//
//  Created by Florian Schweizer on 01.12.21.
//

import Foundation

final class TodoService {
    static let shared = TodoService()
    
    private let baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    // A generic helper function to fetch some Decodable T from a given URL
    private func fetch<T: Decodable>(from endpoint: String) async throws -> T {
        let urlString = baseURL + endpoint
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        // The second return value is a URLResponse, that you can use to check the server's response to your request.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        
        return result
    }
    
    func getAllTodos() async throws -> [Todo] {
        let todos: [Todo] = try await fetch(from: "todos/")
        return todos
    }
    
    func getLatestTodo() async throws -> Todo {
        let todo: Todo = try await fetch(from: "todos/1")
        return todo
    }
}
