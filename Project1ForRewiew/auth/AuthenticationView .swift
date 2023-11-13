//
//  FilmsView.swift
//  Project1ForRewiew
//
//  Created by Maksym on 14.10.2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    @StateObject var signUp = SignUpViewModel()
    var body: some View {
        ZStack{
            Image("man-watching")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ZStack{
                Rectangle()
                    .fill(.gray)
                    .opacity(0.6)
                    .frame(width: 400, height: 530)
                    .cornerRadius(40)
                VStack{
                    VStack(alignment: .leading){
                        Text("Sign up")
                            .foregroundColor(.white)
                            .font(.largeTitle.bold())
                            .padding(.bottom, 1)
                        Text("Access to millions of movies, cartoons and series and more")
                            .foregroundColor(.white)
                    }
                    .frame(width: 350, height: 150)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.6)
                        TextField("", text: $signUp.email, prompt: Text("\(Image(systemName: "envelope.fill"))  Email address").foregroundColor(.black))
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                    }
                    .frame(width: 350, height: 50)
                    .cornerRadius(20)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.6)
                        SecureField("", text: $signUp.password, prompt: Text("\(Image(systemName: "key.fill"))    Password").foregroundColor(.black))
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                    }
                    .frame(width: 350, height: 50)
                    .cornerRadius(20)
                    .padding(.vertical, 7)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.blue)
                            .opacity(0.86)
                        Button{
                            signUp.signUp()
                        }label: {
                            HStack{
                                Image(systemName: "paperplane.circle.fill")
                                    .foregroundColor(.white)
                                Text("Sign up")
                                    .foregroundColor(.white)
                                    .font(.title3.bold())
                            }
                        }
                    }
                    .frame(width: 350, height: 50)
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 6)
                    .padding(.bottom, 10)
                    SignWithAppleView()
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 50)
                        HStack{
                            Button{
                                Task{
                                    do{
                                        try await signUp.signIn()
                                        print("Success")
                                    }catch{
                                        print("Error")
                                    }
                                }
                            }label: {
                                Image("iconGoogle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 25)
                                Text("Sign in with Google")
                                    .foregroundColor(.black)
                                    .font(.title3.bold())
                            }
                        }
                        .cornerRadius(20)
                        .frame(width: 350, height: 50)
                        
                       
                    }
                    .cornerRadius(20)
                    .padding(.top, 10)
          
                }
            }
        }
    }
}
struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
