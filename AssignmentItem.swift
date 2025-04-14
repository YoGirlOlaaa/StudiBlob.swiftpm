//
//  AssignmentItem.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/14/25.
//

import SwiftUI

struct AssignmentItem: Hashable{
    var name : String
    var description: String
    var date: Date
    var id = UUID()
}
