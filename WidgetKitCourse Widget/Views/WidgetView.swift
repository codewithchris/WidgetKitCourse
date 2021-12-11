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
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            case .systemMedium:
                MediumSizeView(entry: entry)
            case .systemLarge:
                LargeSizeView(entry: entry)
            default:
                Text("Not implemented!")
        }
    }
}
