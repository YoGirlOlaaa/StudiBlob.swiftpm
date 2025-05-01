//
//  AssignmentItem.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct AssignmentItem: Hashable, Codable{
    var name : String
    var description: String
    var date: Date
    var points: Int
    var id = UUID()
}
// assignment icon
