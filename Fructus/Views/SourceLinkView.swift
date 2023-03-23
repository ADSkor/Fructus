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
                    HStack {
                        Link("Google", destination: URL(string: "https://google.com/search?q=\(fruit.title)+fruit")!)
                        Image(systemName: "arrow.up.right.square")
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Link("Wikipedia", destination: URL(string: "https://Wikipedia.com/wiki/\(fruit.title)")!)
                        Image(systemName: "arrow.up.right.square")
                    }
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
