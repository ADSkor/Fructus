//
//  LinkDestanation.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 24.03.2023.
//

import SwiftUI

struct LinkDestination: View {
    var fruit: Fruit
    var imageSystemName: String
    var linkName: String
    var url: URL
    var body: some View {
        HStack {
            Link(linkName, destination: url)
            Image(systemName: imageSystemName)
                .foregroundColor(.blue)
        }
    }
}

struct LinkDestanation_Previews: PreviewProvider {
    static var previews: some View {
        LinkDestination(fruit: fruitsData[0],
                        imageSystemName: "arrow.up.right.square",
                        linkName: "Wikipedia",
                        url: URL(string: "https://Wikipedia.com/wiki/\(fruitsData[0].title)")!)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
