//
//  MetricCard.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String
    
    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text(value)
                    .font(.title2.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    MetricCard(title: "Title", value: "Value")
}
