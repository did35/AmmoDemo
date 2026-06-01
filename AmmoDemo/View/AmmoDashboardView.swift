//
//  AmmoDashboardView.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import SwiftUI

struct AmmoDashboardView: View {
    @State private var vm = AmmoDashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    
                }
                .padding()
            }
            .navigationTitle("Ammunition Dashboard")
        }
    }
}

#Preview {
    AmmoDashboardView()
}

// MARK: - AmmoDashboardView extension
extension AmmoDashboardView {
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Stock Simulation")
                .font(.largeTitle.bold())
            
            Text("Estimate ammunition consumption and remaining stock over time.")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
