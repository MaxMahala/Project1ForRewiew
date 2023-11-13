//
//  QuickSignInWithApple.swift
//  Project1ForRewiew
//
//  Created by Maksym on 17.10.2023.
//

import SwiftUI
import AuthenticationServices

struct QuickSignInWithApple: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
