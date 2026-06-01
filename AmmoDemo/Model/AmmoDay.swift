//
//  AmmoDay.swift
//  AmmoDemo
//
//  Created by Didier Delhaisse on 01/06/2026.
//

import Foundation

struct AmmoDay: Identifiable {
    let id = UUID()
    let day: String
    let used: Int
    let remaining: Int
}
