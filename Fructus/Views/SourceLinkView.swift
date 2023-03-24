//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 23.03.2023.
//

import SwiftUI

struct SourceLinkView: View {
    
    var fruit: Fruit
    
    var body: some View {
        GroupBox {
            HStack {
                Text("Search for more info:")
                Spacer()
                VStack {
                    LinkDestination(
                        fruit: fruit,
                        imageSystemName: "arrow.up.right.square",
                        linkName: "Google",
                        url: URL(string: "https://google.com/search?q=\(fruit.title)+fruit")!)
                    Spacer()
                        .frame(height: 20)
                    LinkDestination(
                        fruit: fruit,
                        imageSystemName: "arrow.up.right.square",
                        linkName: "Wikipedia",
                        url: URL(string: "https://Wikipedia.com/wiki/\(fruit.title)")!)
                }
                
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
