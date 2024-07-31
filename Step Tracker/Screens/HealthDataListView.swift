//
//  HealthDataListView.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 14.6.2024.
//

import SwiftUI

struct HealthDataListView: View {
    
    @Environment(HealthKitManager.self) private var hkManager
    @State private var isShowingAddData = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""
    
    var metric: HealthMetricContext
    
    var listData: [HealthMetric] {
        metric == .steps ? hkManager.stepData : hkManager.weightData
    }
    
    var body: some View {
        List(listData.reversed()) { data in
            LabeledContent {
                Text(data.value, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
                    .foregroundStyle(.primary)
            } label: {
                Text(data.date, format: .dateTime.month().day().year())
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Data", selection: $addDataDate, displayedComponents: .date)
                
                LabeledContent(metric.title) {
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {
                        Task {
                            if metric == .steps {
                                do {
                                    try await hkManager.addStepData(for: addDataDate, value: Double(valueToAdd)!)
                                    try await hkManager.fetchStepCount()
                                    isShowingAddData = false
                                } catch STError.sharingDenied(let quantityType) {
                                    print("❌ sharing denied for \(quantityType)")
                                } catch {
                                    print("❌ Data List View Unable to complete request")
                                }
                                
                            } else {
                                do {
                                    try await hkManager.addWeightData(for: addDataDate, value: Double(valueToAdd)!)
                                    try await hkManager.fetchWeights()
                                    try await hkManager.fetchWeightForDifferentials()
                                    isShowingAddData = false
                                } catch STError.sharingDenied(let quantityType) {
                                    print("❌ sharing denied for \(quantityType)")
                                } catch {
                                    print("❌ Data List View Unable to complete request")
                                }
                            }
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData = false
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .weight)
            .environment(HealthKitManager())
    }
}
