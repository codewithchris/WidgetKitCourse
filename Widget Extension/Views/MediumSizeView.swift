//
//  MediumSizeView.swift
//  Widget ExtensionExtension
//
//  Created by Florian Schweizer on 01.12.21.
//

import WidgetKit
import SwiftUI

struct MediumSizeView: View {
    var entry: SimpleEntry

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                
                Divider()
                
                if let todo = entry.todos.first {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.headline)
                        
                        Text(todo.completed ? "Completed" : "Open")
                            .font(.subheadline)
                    }
                }
                
                Spacer()
            }
            .padding()
        } label: {
            Label("My Todos", systemImage: "list.dash")
        }
    }
}
