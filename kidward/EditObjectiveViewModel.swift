//
//  EditObjectiveViewModel.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import Foundation
class EditObjectiveViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var goalPoints: String = ""
    
    init(objective: Objective) {
        self.title = objective.title
        self.goalPoints = "\(objective.goalPoints)"
    }
}
