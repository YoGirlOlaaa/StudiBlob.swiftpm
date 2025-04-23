//
//  AssistStoreSliderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//
import SwiftUI

struct AssistStoreSliderView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    let assists = [
        Assist(name: "Hat", iconName: "Ex1", cost: 30),
        Assist(name: "Shirt", iconName: "Ex2", cost: 20),
        Assist(name: "Dress", iconName: "Ex3", cost: 25),
        Assist(name: "Pants", iconName: "bolt.horizontal", cost: 40),
        Assist(name: "Glasses", iconName: "snowflake", cost: 35),
        Assist(name: "Shoes", iconName: "eye.slash", cost: 50)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
         
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(assists) { assist in
                        AssistCardView(assist: assist, viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

