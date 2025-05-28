//
//  AssistStoreSliderView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//
import SwiftUI

struct AssistStoreSliderView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @State var search: String = ""
    //a list of assist item with name,iconname,cost,category, and picture
    let assists = [
        Assist(name: "Red Hat", iconName: "hat.fill", cost: 30, category: "Hats", picture: "hat.widebrim.fill"),
        Assist(name: "Flower Hat", iconName: "hat.fill", cost: 30, category: "Hats", picture: "hat.widebrim.fill"),
        Assist(name: "Black Hat", iconName: "hat.fill", cost: 20, category: "Hats", picture: "hat.widebrim.fill"),
        Assist(name: "Pink Hat", iconName: "hat.fill", cost: 35, category: "Hats", picture: "hat.widebrim.fill"),
        Assist(name: "Blue Hat", iconName: "hat.fill", cost: 20, category: "Hats", picture: "hat.widebrim.fill"),
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
    
    
    let assistCategories: [String] = ["Red Hat", "Flower Hat", "Black Hat", "Pink Hat", "Classic Pants", "Short", "Nike Shirt", "Blue Shirt", "Pink Shirt", "Jeans", "Pink Pants", "Black Pants", "Nike Sneakers", "BirkenStock", "Uggs", "Adidas", "Jordan", "Sunglasses"]
   var filteredAssists: [Assist] {
       if search.isEmpty {
           return assists
       } else {
           return assists.filter { $0.name.localizedCaseInsensitiveContains(search)}
       }
    }
   
    var groupedAssists: [String: [Assist]] {
        Dictionary(grouping: assists, by: { $0.category})
    }
    var body: some View {
        ScrollView{
            
            
            VStack(alignment: .leading, spacing: 20) {
                TextField("Search here", text: $search)
                    .padding(8)
                    .background((search.isEmpty) ? Color.gray.opacity(0.2) : Color.clear)
                    .cornerRadius(8)
                    .padding(.horizontal)
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


