//
//  ChartDataTypes.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 16.7.2024.
//

import Foundation

struct WeekdayChartData: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}
