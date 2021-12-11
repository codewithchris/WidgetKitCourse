//
//  MediumSizeView.swift
//  WidgetKitCourse WidgetExtension
//
//  Created by Florian Schweizer on 10.12.21.
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
                
                VStack(alignment: .leading) {
                    Text("todo title")
                        .font(.headline)
                    
                    Text("Completed")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
        } label: {
            Label("My Todos", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/1"))
    }
}
