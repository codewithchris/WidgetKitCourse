//
//  Todo.swift
//  WidgetKitCourse
//
//  Created by Florian Schweizer on 01.12.21.
//

import Foundation

struct Todo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

extension Todo {
    static func preview(_ id: Int) -> Todo {
        Todo(userId: 1, id: id, title: "Eat breakfast", completed: false)
    }
}
