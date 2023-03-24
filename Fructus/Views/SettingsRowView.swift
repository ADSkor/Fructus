//
//  SeettingsRowView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 24.03.2023.
//

import SwiftUI

struct SettingsRowView: View {
    //properties
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    //body
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if let content {
                    Text(content)
                } else if
                    let linkLabel,
                    let linkDestination,
                    let url = URL(string: "https://\(linkDestination)") {
                    Link(linkLabel, destination: url)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

//preview
struct SeettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Skorotkin Aleksandr")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
