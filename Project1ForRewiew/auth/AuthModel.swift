//
//  AuthViewModel.swift
//  Project1ForRewiew
//
//  Created by Maksym on 16.10.2023.
//

import Foundation
import FirebaseAuth


struct AuthDataResultModel{
    var uid: String
    var email: String?
    var photoURL: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}


final class AuthentificationManager {
    static let shared = AuthentificationManager()
    private init(){}
    
    
  
}
extension AuthentificationManager{
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authResult.user)
    }
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
