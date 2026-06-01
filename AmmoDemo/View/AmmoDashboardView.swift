//
//  AmmoDashboardView.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import SwiftUI
import Charts

struct AmmoDashboardView: View {
    @State private var vm = AmmoDashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    
                    controls
                    
                    metricsGrid
                    
                    usageChart
                    
                    stockChart
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
    
    private var controls: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 16) {
                Stepper("Initial stock: \(vm.initialStock)", value: $vm.initialStock, in: 1_000...50_000, step: 500)
                Divider()
                Stepper("Daily usage: \(vm.dailyUse)", value: $vm.dailyUse, in: 100...5_000, step: 50)
            }
        }
    }
    
    private var metricsGrid: some View {
        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                MetricCard(title: "Initial", value: "\(vm.initialStock)")
                MetricCard(title: "Used", value: "\(vm.totalUsed)")
            }
            
            GridRow {
                MetricCard(title: "Remaining", value: "\(vm.stockRemaining)")
                MetricCard(title: "Endurance", value: "\(vm.enduranceDays)d")
            }
        }
    }
    
    private var usageChart: some View {
        GlassCard {
            VStack(alignment: .leading) {
                Text("Daily Ammunition Use")
                    .font(.headline)
                
                Chart(vm.simulation) { item in
                    BarMark(
                        x: .value("Day", item.day),
                        y: .value("Used", item.used)
                    )
                }
                .frame(height: 220)
            }
        }
    }
    
    private var stockChart: some View {
        GlassCard {
            VStack(alignment: .leading) {
                Text("Stock Remaining")
                    .font(.headline)
                
                Chart(vm.simulation) { item in
                    LineMark(
                        x: .value("Day", item.day),
                        y: .value("Remaining", item.remaining)
                    )
                    
                    PointMark(
                        x: .value("Day", item.day),
                        y: .value("Remaining", item.remaining)
                    )
                }
                .frame(height: 220)
            }
        }
    }
}
