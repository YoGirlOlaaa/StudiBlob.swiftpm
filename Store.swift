//
//  Store.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/16/25.
//

import SwiftUI

struct Store: View {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Store")
                .font(.largeTitle)
                .bold()
                .frame(alignment: .top)
            
            VStack(alignment: .trailing){
                Text("Points: \(viewModel.gold) ")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                
                AssistStoreSliderView(viewModel: viewModel)
                
                
                Spacer()
            }
        }
    }
    
}
#Preview {
    Store()
}
