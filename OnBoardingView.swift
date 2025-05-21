//
//  OnBoardingView.swift
//  AppShowCase.swiftpm
//
//  Created by Aleksandra J. Oleksiak on 5/19/25.
//


import SwiftUI
let customBlue = UIColor(named: "#3399FF")
struct OnboardingView: View {
    var body: some View {
        TabView{
            OB1View()
            OB2View()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}

struct OB1View: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
              .fill(.blue.gradient)
                .opacity(0.5)
            VStack{
                Text("How to use StudiBlob")
                    .font(.custom("Futura", size: 30))
                       .font(.title)
                       
             Text("1. Click 'Add an Asignment' to create a new assignment.")
                    .font(.custom("Futura", size: 20))
                    .font(.headline)
                Text("2. Completeing assignment gives you points that you can use in the store to obtain fun accessories.")
                    .font(.custom("Futura", size: 20))
                    .font(.headline)
                    
            }
              .foregroundStyle(.white)
        }
            .frame(width: 500, height: 500)
    }
}

    
    struct OB2View: View {
        @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
        var body: some View {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue.gradient)
                    .opacity(0.5)
                VStack{
                    Text("Last But Not Least")
                        .font(.custom("Futura", size: 30))
                        .font(.title)
                    Text("3. Click 'Go to the Store' to see your points and how much you can spend on your favorite items.")
                        .font(.custom("Futura", size: 20))
                        .frame(width: 400)
                    Image("Blober")
                        .font(.largeTitle)
                        .padding(0.5)
                    Button("Get Started"){
                        hasSeenOnboarding = true
                    }
                    .font(.custom("Futura", size: 30))
                    .font(.largeTitle)
                }
                
                .foregroundStyle(.white)
            }
            .frame(width: 500, height: 500)
        }
    }
    
    

