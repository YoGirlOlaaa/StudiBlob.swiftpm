//
//  AssignmentItem.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI
import SwiftData


@Model
class AssignmentItem/*: Hashable, Codable*/{
    var name : String
    var descriptionn: String
    var date: Date
    var points: Int
    var id = UUID()
    
    
    init(name: String, description: String, date: Date, points: Int, id: UUID = UUID()) {
        self.name = name
        self.descriptionn = description
        self.date = date
        self.points = points
        self.id = id
    }
}
