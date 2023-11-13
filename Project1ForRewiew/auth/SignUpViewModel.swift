//
//  SignInViewModel.swift
//  Project1ForRewiew
//
//  Created by Maksym on 16.10.2023.
//

import Foundation
import GoogleSignInSwift
import GoogleSignIn
import FirebaseAuth

struct GoogleSignInResultModel{
    var idToken: String
    var accessToken: String
}

@MainActor
final class SignUpViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signUp(){
        guard !email.isEmpty || !password.isEmpty else {
            print("email or password is empty")
            return
        }
        
        Task{
            do{
                let returnUserData = try await AuthentificationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnUserData)
            }catch{
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    func signIn() async throws{
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignIn = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignIn.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignIn.user.accessToken.tokenString
         
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        try await AuthentificationManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}
