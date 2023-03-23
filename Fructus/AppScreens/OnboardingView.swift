//
//  OnboardingView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 15.02.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - Properties
    var fruits: [Fruit] = fruitsData
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { fruit in
                FruitCardView(fruit: fruit)
            }//Loop
        }//TabView
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
