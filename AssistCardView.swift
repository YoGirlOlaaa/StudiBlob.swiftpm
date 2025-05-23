//
//  AssistCardView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 4/23/25.
//

import SwiftUI

struct AssistCardView: View {
    let assist: Assist
    @ObservedObject var viewModel: CharacterViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Image(assist.picture)
                .resizable()
//                .frame(width: 200, height: 200)
                .padding()
                .offset(y: 15)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                
            Text(assist.name)
                .font(.caption)
                .fontWeight(.medium)
            
            Text("\(assist.cost) Points")
                .font(.caption2)
                .foregroundColor(.gray)
            //view in store
            Button(action: {
                viewModel.buy(assist)
            }) {
                Text(viewModel.hasAssist(assist) ? "Owned" : "Buy")
                    .font(.caption)
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(viewModel.hasAssist(assist) ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
            .disabled(viewModel.hasAssist(assist))
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 4 - 20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

//button to buy a card(thing)
