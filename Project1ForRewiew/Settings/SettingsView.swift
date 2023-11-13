//
//  SettingsAndAccount.swift
//  Project1ForRewiew
//
//  Created by Maksym on 14.10.2023.
//

import SwiftUI
struct SettingsView: View {
@Environment(\.colorScheme) var colorScheme
@State private var colorTag = 0
@AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        List{
            Section{
                HStack{
                    Image(systemName: "envelope.fill")
                    Text("Email")
                }
                HStack{
                    Image(systemName: "popcorn.fill")
                    Text("Movie Catalog")
                }
                HStack{
                    Image(systemName: "newspaper.fill")
                    Text("Custom Instruction")
                }
                HStack{
                    Image(systemName: "creditcard.fill")
                    Text("Subscription")
                }
            }header: {
                Text("account")
            }
            Section{
                HStack{
                    Image(systemName: "paintbrush.fill")
                    Text("Color Scheme")
                    Toggle("dark mode", isOn: $isDarkMode)
                  
                }
                HStack{
                    Image(systemName: "water.waves")
                    Text("Haptic Feedback")
                }
            }header: {
                Text("app")
            }
            Section{
                HStack{
                    Image(systemName: "globe")
                    Text("Main Language")
                }
            }header: {
                Text("Language")
            }
            Section{
                HStack{
                    Image(systemName: "questionmark.circle.fill")
                    Text("Help Center")
                }
                HStack{
                    Image(systemName: "magazine.fill")
                    Text("Terms of us")
                }
                HStack{
                    Image(systemName: "hand.raised.fill")
                    Text("Privacy Policy")
                }
                HStack{
                    Image(systemName: "book.closed.fill")
                    Text("Licenses")
                }
            }
            HStack{
                Image(systemName: "pip.exit")
                Text("Sign Out")
            }
            
        }
        .preferredColorScheme(colorTag == 0 ? .dark : .light)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
