//
//  ContentView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 09.02.2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    var fruits: [Fruit] = fruitsData
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.sorted(by: {$0.title<$1.title} )) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                            .ignoresSafeArea()
                    }
                }
            }
            .navigationTitle("Fruits")
//            .padding(.leading, -16)
//            .padding(.trailing, -20)
        }//End of NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
