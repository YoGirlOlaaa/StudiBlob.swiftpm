//
//  Untitled.swift
//  AppShowCase.swiftpm
//
//  Created by Cassandra Botnari on 4/16/25.
//
import SwiftUI

class AssignmentStorage: ObservableObject {
    @AppStorage("assignments") var assignmentsData: Data = Data()
    @Published var items: [AssignmentItem] = [] {
        didSet{
            saveAssignments()
        }
    }
    init(){
        loadAssignments()
    }
}
