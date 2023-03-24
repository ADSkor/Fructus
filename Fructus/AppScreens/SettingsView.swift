//
//  SettingsView.swift
//  Fructus
//
//  Created by Aleksandr Skorotkin on 24.03.2023.
//

import SwiftUI

struct SettingsView: View {
    //properties
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State private var refreshApp: Bool = false
    @State private var showAlert = false
    
    //body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    //section1
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                        .frame(alignment: .center)
                    } label: {
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    }//groupBox
                    
                    //section2
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle thee switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $refreshApp) {
                            if refreshApp {
                                Text("restart in process".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(
                                UIColor.tertiarySystemBackground
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 8, style: .continuous)
                            )
                        )
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Fructus will restart"), dismissButton: .default(Text("OK")) {
                                isOnboarding.toggle()
                            })
                        }
                        .onChange(of: refreshApp) { newValue in
                            showAlert = true
                        }
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    }
                    
                    //section3
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "Skorotkin Aleksandr")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compability", content: "iOS 16.0")
                        SettingsRowView(name: "WebSite", linkLabel: "GitHub", linkDestination: "github.com/ADSkor")
                        SettingsRowView(name: "SwiftUI", content: " March 2023")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }//groupBox

                }//Vstack
                .navigationTitle("Settings")
                .toolbar {
                    Button(action: {
                        dismiss.callAsFunction()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .padding()
            }//scrollView
        }//navigationView
    }
    
    private func showAlertWithRestart() {
        debugPrint("dwdwdwd")
    }
}

//preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
