//
//  Provider.swift
//  Widget ExtensionExtension
//
//  Created by Florian Schweizer on 01.12.21.
//

import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.preview(1), .preview(2)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let todos = try await TodoService.shared.getAllTodos()
                let entry = SimpleEntry(date: .now, todos: todos)
                
                completion(entry)
            } catch {
                completion(SimpleEntry(date: .now, todos: [.preview(0)]))
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            do {
                let allTodos = try await TodoService.shared.getAllTodos()
                let lastFiveTodos = Array(allTodos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: lastFiveTodos)
                
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            } catch {
                let entries = [SimpleEntry(date: .now, todos: [.preview(0)])]
                let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            }
        }
    }
}
