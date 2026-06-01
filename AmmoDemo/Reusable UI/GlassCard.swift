//
//  GlassCard.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import SwiftUI

struct GlassCard<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.15))
            }
    }
}


