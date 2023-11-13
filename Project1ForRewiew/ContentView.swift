//
//  ContentView.swift
//  Project1ForRewiew
//
//  Created by Maksym on 14.10.2023.
//

import SwiftUI

enum TitleCases: String{
    case House, Films, Account, Settings
}

struct ContentView: View {
    @State private var selectedTab = 1
    var filter: TitleCases
    @State private var title = TitleCases.Films
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView{
            TabView(selection: $title){
                MainView()
                    .tabItem{
                        Image(systemName: "bookmark.fill")
                    }
                    .tag(TitleCases.House)
               
                MovieView()
                    .tabItem{
                        Image(systemName: "popcorn.fill")
                        }
                    .tag(TitleCases.Films)
              
                AuthenticationView()
                    .tabItem{
                        Image(systemName: "person.fill")
                    }
                    .tag(TitleCases.Account)
               
                SettingsView()
                    .tabItem{
                        Image(systemName: "gearshape.fill")
                    }
                    .tag(TitleCases.Settings)
            }
            .toolbarBackground(.white, for: .navigationBar)
            .tint(.white)
            .navigationTitle(title.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "plus")
                            .font(.headline)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(filter: TitleCases.House)
    }
}
