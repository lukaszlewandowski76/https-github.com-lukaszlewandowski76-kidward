//
//  EditObjectiveView.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import SwiftUI

struct EditObjectiveView: View {
    @Environment(\.dismiss) var dismiss
    var objective: Objective
    var viewModel: ObjectivesViewModel
    @State private var title: String
    @State private var goalPoints: String
    @State private var currentPoints: Int // Added to manage current points state

    init(objective: Objective, viewModel: ObjectivesViewModel) {
        self.objective = objective
        self.viewModel = viewModel
        _title = State(initialValue: objective.title)
        _goalPoints = State(initialValue: String(objective.goalPoints))
        _currentPoints = State(initialValue: objective.currentPoints) // Initialize with currentPoints from the objective
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Goal Points", text: $goalPoints)
                    .keyboardType(.numberPad)
                
                Section(header: Text("Add Points")) {
                    HStack {
                        ForEach([1, 5, 10, 25, 50], id: \.self) { points in
                            Button("\(points)") {
                                self.currentPoints += points // Add points directly to the currentPoints state
                            }
                            .buttonStyle(.bordered)
                            .padding(4)
                        }
                    }
                }
            }
            .navigationTitle("Edit Objective")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let goalPointsInt = Int(goalPoints) {
                            // Update the objective using the current state values for title, goalPoints, and currentPoints
                            viewModel.updateObjective(id: objective.id, title: title, goalPoints: goalPointsInt, currentPoints: currentPoints)
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}









