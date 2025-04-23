//
//  CharacterViewModel.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//


import SwiftUI

class CharacterViewModel: ObservableObject {
    @Published var gold: Int = 100
    @Published var ownedAssists: [Assist] = []
    
    func buy(_ assist: Assist) {
        guard !ownedAssists.contains(assist), gold >= assist.cost else { return }
        gold -= assist.cost
        ownedAssists.append(assist)
    }
    
    func hasAssist(_ assist: Assist) -> Bool {
        return ownedAssists.contains(assist)
    }
}
