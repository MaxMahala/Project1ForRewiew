//
//  Project1ForRewiewApp.swift
//  Project1ForRewiew
//
//  Created by Maksym on 14.10.2023.
//
import SwiftUI
import Firebase
import FirebaseCore
import GoogleSignIn

@main
struct Project1ForRewiewApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView(filter: TitleCases.House)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


