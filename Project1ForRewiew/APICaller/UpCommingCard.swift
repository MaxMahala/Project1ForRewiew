//
//  UpCommingCard.swift
//  Project1ForRewiew
//
//  Created by Maksym on 22.10.2023.
//

import SwiftUI

struct UpCommingCard: View {
    let upComing: MovieItem
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading){
                AsyncImage(url: upComing.backDropUrl){ image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 170, height: 100)
                .padding(.horizontal)
                .shadow(color: colorScheme == .dark ? Color.blue : Color.green, radius: 6)
            VStack(alignment: .leading){
                Text(upComing.title ?? "Unknown")
                    .foregroundColor(.white)
                    .font(.headline)
                    .shadow(color: .black, radius: 10)
                    .frame(width: 140, alignment: .leading)
                    .lineLimit(1)
                    .fixedSize()
                    .padding(.leading, 10)
                HStack{
                    Text("\(upComing.vote_average, format: .number)")
                        .foregroundColor(.white)
                        .font(.headline)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .frame(width: 170, height: 20, alignment: .leading)
                .padding(.leading, 10)
                .cornerRadius(20)
            }
                  
        }
        .padding(.leading)
        .padding(.top, 6)
    }
}
