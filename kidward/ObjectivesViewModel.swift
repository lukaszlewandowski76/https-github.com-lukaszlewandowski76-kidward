//
//  ObjectivesViewModel.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import Foundation
import Combine

class ObjectivesViewModel: ObservableObject {
    @Published var objectives = [Objective]()
    
    func addObjective(title: String, goalPoints: Int, currentPoints: Int) {
        let newObjective = Objective(title: title, goalPoints: goalPoints, currentPoints: currentPoints)
        objectives.append(newObjective)
    }

    func updateObjective(id: UUID, title: String, goalPoints: Int, currentPoints: Int) {
        if let index = objectives.firstIndex(where: { $0.id == id }) {
            objectives[index].title = title
            objectives[index].goalPoints = goalPoints
            objectives[index].currentPoints = currentPoints
        }
    } // This closing brace properly ends the updateObjective function

    func addPoints(toObjectiveId id: UUID, points: Int) {
        guard let index = objectives.firstIndex(where: { $0.id == id }) else { return }
        objectives[index].currentPoints += points
    }
}





