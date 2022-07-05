//
//  WidgetView.swift
//  WidgetKitCourse WidgetExtension
//
//  Created by Florian Schweizer on 06.12.21.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry // aka SimpleEntry

    var body: some View {
        switch widgetFamily {
            case .systemMedium:
                MediumSizeView(entry: entry)
                
            case .systemLarge:
                LargeSizeView(entry: entry)
                
            case .accessoryInline:
                Text(entry.todos.first?.title ?? "No todos")
                
            case .accessoryCircular:
                Gauge(value: 0.7) {
                    Text(entry.date, format: .dateTime.year())
                }
                .gaugeStyle(.accessoryCircular)
                
            case .accessoryRectangular:
                Gauge(value: 0.7) {
                    Text(entry.date, format: .dateTime.year())
                }
                .gaugeStyle(.accessoryLinear)
                
            default:
                Text("Not implemented!")
        }
    }
}
