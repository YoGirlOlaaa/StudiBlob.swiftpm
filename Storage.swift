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
    func saveAssignments(){
        do {
            let encoder = JSONEncoder()
            assignmentsData = try encoder.encode(items)
        } catch {
            print("Failed to save assignments: \(error)")
        }
    }
    func loadAssignments() {
        guard let decodedAssignments = try? JSONDecoder().decode([AssignmentItem].self, from: assignmentsData) else { return }
                items = decodedAssignments
    }
}

