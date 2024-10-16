//
//  Step_TrackerApp.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 14.6.2024.
//

import SwiftUI

@main
struct Step_TrackerApp: App {
    
    let hkData = HealthKitData()
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkData)
                .environment(hkManager)
        }
    }
}
