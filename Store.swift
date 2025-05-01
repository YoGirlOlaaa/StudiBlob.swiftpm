//
//  Store.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/16/25.
//

import SwiftUI

struct Store: View {
    @StateObject var viewModel = CharacterViewModel()
    @AppStorage("totalPoints") var totalPoints: Int = 0
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Store")
                .font(.largeTitle)
                .bold()
                .frame(alignment: .top)
            
            VStack(alignment: .trailing){
                Text("Points: \(totalPoints) ")
                    .font(.headline)
                    .padding(.horizontal)
                
                if !viewModel.ownedAssists.isEmpty {
                    ScrollView{
                        VStack(alignment: .leading, spacing: 5){
                            Text("You bought:")
                                .font(.headline)
                            
                            ForEach(viewModel.ownedAssists, id: \.id){ assist in
                                Text("- \(assist.name)")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .frame(height: 150)
                }
                
                AssistStoreSliderView(viewModel: viewModel)
                
                
                Spacer()
            }
        }
    }
    
}
#Preview {
    Store()
}
// store view displays how points are counted, how many points the user has, and what the user has purchased.
