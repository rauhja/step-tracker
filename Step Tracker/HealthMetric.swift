//
//  HealthMetric.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 15.7.2024.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
