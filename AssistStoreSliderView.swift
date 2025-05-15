//
//  AssistStoreSliderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//
import SwiftUI

struct AssistStoreSliderView: View {
    @ObservedObject var viewModel: CharacterViewModel
    //a list of assist item with name,iconname,cost,category, and picture
    let assists = [
        Assist(name: "Crown", iconName: "Crown", cost: 30, category: "Hats", picture: "Crown"),
        Assist(name: "Black Top Hat", iconName: "hat.fill", cost: 30, category: "Hats", picture: "Black Top Hat"),
        Assist(name: "Witch Hat", iconName: "hat.fill", cost: 20, category: "Hats", picture: "Witch Hat"),
        Assist(name: "Halo", iconName: "hat.fill", cost: 35, category: "Hats", picture: "Halo"),
        Assist(name: "Horns", iconName: "hat.fill", cost: 20, category: "Hats", picture: "Horns"),
        Assist(name: "Green Shirt", iconName: "tshirt.fill", cost: 25, category: "Shirts", picture: "tshirt.fill"),
        Assist(name: "Classic Pants", iconName: "jeans.walk", cost: 35, category: "Pants", picture: "figure.socialdance"),
        Assist(name: "Short", iconName: "jeans.walk", cost: 25, category: "Pants", picture: "figure.socialdance"),
        Assist(name: "Nike Shirt", iconName: "tshirt.fill", cost: 40, category: "Shirts", picture: "tshirt.fill"),
        Assist(name: "Blue Shirt", iconName: "tshirt.fill", cost: 20, category: "Shirts", picture: "tshirt.fill"),
        Assist(name: "Pink Shirt", iconName: "tshirt.fill", cost: 40, category: "Shirts", picture: "tshirt.fill"),
        Assist(name: "Jeans", iconName: "jeans.walk", cost: 35, category: "Pants", picture: "figure.socialdance"),
        Assist(name: "Pink Pants", iconName: "jeans.walk", cost: 35, category: "Pants", picture: "figure.socialdance"),
        Assist(name: "Black Pants", iconName: "jeans.walk", cost: 20, category: "Pants", picture: "figure.socialdance"),
        Assist(name: "Nike Sneakers", iconName: "shoe", cost: 20, category: "Shoes", picture: "shoe"),
        Assist(name: "BirkenStock", iconName: "shoe", cost: 20, category: "Shoes", picture: "shoe"),
        Assist(name: "Uggs", iconName: "shoe", cost: 20, category: "Shoes", picture: "shoe"),
        Assist(name: "Adidas", iconName: "shoe", cost: 20, category: "Shoes", picture: "shoe"),
        Assist(name: "Jordan", iconName: "shoe", cost: 20, category: "Shoes", picture: "shoe")
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


