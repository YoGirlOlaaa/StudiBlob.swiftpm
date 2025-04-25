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
        Assist(name: "Red Hat", iconName: "hat.fill", cost: 30, category: "Hats"),
        Assist(name: "Flower Hat", iconName: "hat.fill", cost: 30, category: "Hats"),
        Assist(name: "Black Hat", iconName: "hat.fill", cost: 20, category: "Hats"),
        Assist(name: "Pink Hat", iconName: "hat.fill", cost: 35, category: "Hats"),
        Assist(name: "Blue Hat", iconName: "hat.fill", cost: 20, category: "Hats"),
        Assist(name: "Green Shirt", iconName: "tshirt.fill", cost: 25, category: "Shirts"),
        Assist(name: "Blue Shirt", iconName: "tshirt.fill", cost: 40, category: "Shirts"),
        Assist(name: "Pink Shirt", iconName: "tshirt.fill", cost: 40, category: "Shirts"),
        Assist(name: "Jeans", iconName: "jeans.walk", cost: 35, category: "Pants"),
        Assist(name: "Pink Pants", iconName: "jeans.walk", cost: 35, category: "Pants"),
        Assist(name: "Black Pants", iconName: "jeans.walk", cost: 50, category: "Pants")
    ]
    
    var groupedAssists: [String: [Assist]] {
        Dictionary(grouping: assists, by: { $0.category})
    }
    var body: some View {
        ScrollView{
            
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(groupedAssists.keys.sorted(), id: \.self) { category in
                    VStack(alignment: .leading) {
                        Text(category)
                            .font(.title2)
                            .bold()
                        // .padding(.leading)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(groupedAssists[category]!, id: \.id) { assist in
                                    AssistCardView(assist: assist, viewModel: viewModel)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        } } }


