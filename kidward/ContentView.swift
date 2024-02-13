//
//  ContentView.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case addNew
    case editObjective(Objective)

    var id: String {
        switch self {
        case .addNew: return "addNew"
        case .editObjective(let objective): return objective.id.uuidString
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ObjectivesViewModel()
    @State private var activeSheet: ActiveSheet?

    let pointsToAdd = [1, 5, 10, 25, 50] // Defined points to add

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.objectives) { objective in
                    VStack(alignment: .leading) {
                        Text(objective.title)
                            .font(.headline)

                        // Display the numeric progress
                        Text("\(objective.currentPoints) points out of \(objective.goalPoints) Goal Points")
                            .font(.subheadline)
                            .padding(.bottom, 2)
                        
                        // ProgressBar view to visually represent progress
                        ProgressBar(progress: Float(objective.currentPoints) / Float(objective.goalPoints))
                            .frame(height: 10)

                        // Point addition buttons
                        HStack {
                            ForEach(pointsToAdd, id: \.self) { points in
                                Button(action: {
                                    viewModel.addPoints(toObjectiveId: objective.id, points: points)
                                }) {
                                    Text("+\(points)")
                                        .padding(5)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                }
                            }
                        }
                        .padding(.top, 2) // Add some spacing above the point addition buttons
                    }
                    .padding() // Add padding around each objective for better spacing
                }
                .onDelete(perform: deleteObjective)
            }
            .navigationTitle("Objectives")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.activeSheet = .addNew
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .addNew:
                AddObjectiveView(viewModel: viewModel)
            case .editObjective(let objective):
                EditObjectiveView(objective: objective, viewModel: viewModel)
            }
        }
    }

    func deleteObjective(at offsets: IndexSet) {
        viewModel.objectives.remove(atOffsets: offsets)
    }

        }
    

