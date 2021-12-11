//
//  WidgetKitCourse_Widget.swift
//  WidgetKitCourse Widget
//
//  Created by Florian Schweizer on 06.12.21.
//

import WidgetKit
import SwiftUI

@main
struct WidgetKitCourse_Widget: Widget {
    let kind: String = "WidgetKitCourse_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Todos")
        .description("View your latest todo(s).")
    }
}

struct WidgetKitCourse_Widget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
