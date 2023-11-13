//
//  TredingCard.swift
//  Project1ForRewiew
//
//  Created by Maksym on 18.10.2023.
//

import SwiftUI

struct TrendingCard: View {
    let tredingItem: MovieItem
    @Environment (\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: tredingItem.backDropUrl){ image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                }placeholder: {
                    ProgressView()
                }
                .padding(.horizontal, 4)
                .shadow(color: colorScheme == .dark ? Color.blue : Color.green, radius: 6)
            HStack{
                Text(tredingItem.title ?? "Unknown")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 240, alignment: .leading)
                    .lineLimit(1)
                    .fixedSize()
                    .padding(.leading, 15)
                Spacer()
                HStack{
                    Text("\(tredingItem.vote_average, format: .number)")
                        .foregroundColor(.yellow)
                        .font(.headline)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .frame(width: 80)
            }
            .padding(.horizontal)
                  
        }
        .frame(width: 390, height: 230)
        .padding(.top, 5)

    }
}
