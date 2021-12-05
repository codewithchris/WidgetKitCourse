//
//  WidgetView.swift
//  Widget ExtensionExtension
//
//  Created by Florian Schweizer on 01.12.21.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    let entry: SimpleEntry
    
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
