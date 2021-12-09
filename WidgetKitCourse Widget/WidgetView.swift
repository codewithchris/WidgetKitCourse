//
//  WidgetView.swift
//  WidgetKitCourse WidgetExtension
//
//  Created by Florian Schweizer on 06.12.21.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
