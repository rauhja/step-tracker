//
//  HealthKitManager.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 8.7.2024.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
