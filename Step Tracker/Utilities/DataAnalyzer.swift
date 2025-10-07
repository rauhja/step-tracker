//
//  DataAnalyzer.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 7.10.2025.
//

import Foundation
import FoundationModels

@available(iOS 26, *)
@Observable
final class DataAnalyzer {
    static let shared = DataAnalyzer()
    let model: SystemLanguageModel = .default
    
    private init() { }
}
