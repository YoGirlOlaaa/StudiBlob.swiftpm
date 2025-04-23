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
                
                
                
                AssistStoreSliderView(viewModel: viewModel)
                
                
                Spacer()
            }
        }
    }
    
}
#Preview {
    Store()
}
