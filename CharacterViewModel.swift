//
//  CharacterViewModel.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//


import SwiftUI

class CharacterViewModel: ObservableObject {
    @AppStorage("totalPoints") var totalPoints: Int = 0
    
    @Published var lastPurchasedAssistName: String? = nil
    @Published var gold: Int = 100
    @Published var ownedAssists: [Assist] = []
    
    func buy(_ assist: Assist) {
        guard totalPoints >= assist.cost else {return}
        totalPoints -= assist.cost

                ownedAssists.append(assist)
        lastPurchasedAssistName = assist.name
    }
     
    func hasAssist(_ assist: Assist) -> Bool {
        return ownedAssists.contains(assist)
    }
}
