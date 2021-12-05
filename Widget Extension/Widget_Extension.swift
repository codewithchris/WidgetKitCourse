//
//  Widget_Extension.swift
//  Widget Extension
//
//  Created by Florian Schweizer on 01.12.21.
//

import WidgetKit
import SwiftUI

@main
struct Widget_Extension: Widget {
    let kind: String = "Widget_Extension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("Todo Widget")
        .supportedFamilies([.systemMedium, .systemLarge])
        .description("View your latest todo(s)!")
    }
}

struct Widget_Extension_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: .now, todos: [.preview(1), .preview(2)]))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
