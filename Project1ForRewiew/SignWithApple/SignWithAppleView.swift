//
//  SignWithAppleView.swift
//  Project1ForRewiew
//
//  Created by Maksym on 17.10.2023.
//

import SwiftUI
import AuthenticationServices

struct SignWithAppleView: View {
    var body: some View {
        VStack{
            QuickSignInWithApple()
                .frame(width: 350, height: 50)
                .cornerRadius(20)
                .onTapGesture(perform: showAppleLoginView)
        }
    }
    private func showAppleLoginView() {
        let signInWithAppleViewModel = SignInWithAppleViewModel()
        
        let provider = ASAuthorizationAppleIDProvider()
          // 2. Create a request with the help of provider - ASAuthorizationAppleIDRequest
          let request = provider.createRequest()
          // 3. Scope to contact information to be requested from the user during authentication.
          request.requestedScopes = [.fullName, .email]
          // 4. A controller that manages authorization requests created by a provider.
          let controller = ASAuthorizationController(authorizationRequests: [request])
          // 5. Set delegate to perform action
          controller.delegate = signInWithAppleViewModel
          // 6. Initiate the authorization flows.
          controller.performRequests()
     }
    func SignInButton(_ type: SignInWithAppleButton.Style) -> some View{
           return SignInWithAppleButton(.signIn) { request in
               request.requestedScopes = [.fullName, .email]
           } onCompletion: { result in
               switch result {
               case .success(let authResults):
                   print("Authorisation successful \(authResults)")
               case .failure(let error):
                   print("Authorisation failed: \(error.localizedDescription)")
               }
           }
           .frame(width: 280, height: 60, alignment: .center)
           .signInWithAppleButtonStyle(type)
    }
}

struct SignWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        SignWithAppleView()
    }
}
