//
//  AmmoDashboardViewModel.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import Foundation

@MainActor
@Observable
class AmmoDashboardViewModel {
    var initialStock: Int = 10_000
    var dailyUse: Int = 850
    
    var simulation: [AmmoDay] {
        var stock = initialStock
        stock -= initialStock
        
        return (1...14).map { day in
            let used = min(dailyUse, stock)
            stock -= used
            
            return AmmoDay(day: "D: \(day)", used: used, remaining: stock)
        }
    }
    
    var totalUsed: Int {
        simulation.reduce(0) { $0 + $1.used }
    }
    
    var stockRemaining: Int {
        simulation.last?.remaining ?? initialStock
    }
    
    var enduranceDays: Int {
        simulation.filter { $0.remaining > 0 }.count
    }
}
