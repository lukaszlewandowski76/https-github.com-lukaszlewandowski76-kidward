//
//  AddObjectiveView.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import SwiftUI

struct AddObjectiveView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ObjectivesViewModel
    @State private var title = ""
    @State private var goalPoints = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Goal Points", text: $goalPoints)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add Objective")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let goalPointsInt = Int(goalPoints) {
                            // Assuming starting currentPoints as 0 for new objectives
                            viewModel.addObjective(title: title, goalPoints: goalPointsInt, currentPoints: 0)
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

