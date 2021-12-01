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
