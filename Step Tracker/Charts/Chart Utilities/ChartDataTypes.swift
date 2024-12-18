//
//  ChartDataTypes.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 16.7.2024.
//

import Foundation

struct DateValueChartData: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}
