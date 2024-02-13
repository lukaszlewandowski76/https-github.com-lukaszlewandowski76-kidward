//
//  Objective.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import Foundation

struct Objective: Identifiable {
    let id: UUID = UUID()
    var title: String
    var goalPoints: Int
    var currentPoints: Int // Ensure this property is included
}




