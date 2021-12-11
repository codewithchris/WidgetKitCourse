//
//  LargeSizeView.swift
//  WidgetKitCourse WidgetExtension
//
//  Created by Florian Schweizer on 10.12.21.
//

import WidgetKit
import SwiftUI

struct LargeSizeView: View {
    var entry: SimpleEntry
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text("My Todos")
                
                Text(Date.now, format: .dateTime)
                
                Spacer()
            }
            .padding(8)
            .background(.blue)
            .foregroundColor(.white)
            .clipped()
            .shadow(radius: 5)
            
            ForEach(0..<6, id: \.self) { _ in
                Link(destination: URL(string: "myapp://todo/1")!) {
                    HStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay {
                                if true {
                                    Image(systemName: "checkmark")
                                }
                            }
                        
                        Text("todo title")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                Divider()
            }
            
            Spacer()
        }
    }
}
