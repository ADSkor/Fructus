//
//  FruitCardView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 09.02.2023.
//

import SwiftUI

struct FruitCardView: View {
    //MARK: - Properties
    
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //Fruit Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                //Fruit title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                //fruit headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                //button start
                StartButtonView()
            } //: VStack
        } //: ZStack
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        })
        .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom
            )
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .onDisappear {
            isAnimating = false
        }
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
