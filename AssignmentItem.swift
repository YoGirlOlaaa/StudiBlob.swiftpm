//
//  AssignmentItem.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI
import SwiftData

@Model
class AssignmentItem {
    @Attribute var id: UUID
    @Attribute var name: String
    @Attribute var descriptionn: String
    @Attribute var date: Date
    @Attribute var totalPoints: Int
    
    init(name: String, description: String, date: Date, points: Int, id: UUID = UUID()) {
        self.name = name
        self.descriptionn = description
        self.date = date
        self.totalPoints = points
        self.id = id
    }
}
