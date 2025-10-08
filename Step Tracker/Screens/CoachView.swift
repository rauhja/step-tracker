//
//  CoachView.swift
//  Step Tracker
//
//  Created by Jarkko Rauhala on 8.10.2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct CoachView: View {
    @Environment(\.dismiss) var dismiss
    let analyser = DataAnalyzer.shared
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(.craig)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(.circle)
                
                Text("Coach Craig")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("Ok", systemImage: "checkmark") {
                    dismiss()
                }
                .padding(12)
                .labelStyle(.iconOnly)
                .clipShape(.circle)
                .glassEffect(.regular.tint(.pink).interactive())
            }
            
            ScrollView {
                Text(analyser.coachMessage ?? "")
                    .contentTransition(.interpolate)
                    .animation(.easeInOut(duration: 0.8), value: analyser.coachMessage)
            }
            .overlay {
                if analyser.isThinking {
                    VStack(spacing: 16) {
                        Image(systemName: "apple.intelligence")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .symbolEffect(.pulse, options: .repeat(.continuous))
                        
                        Text("Thinking...")
                            .font(.callout)
                    }
                    .foregroundStyle(.secondary)
                    .frame(minWidth: 200)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

@available(iOS 26.0, *)

#Preview {
    CoachView()
}
