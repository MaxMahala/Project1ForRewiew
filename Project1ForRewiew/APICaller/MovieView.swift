//
//  MovieView.swift
//  Project1ForRewiew
//
//  Created by Maksym on 16.10.2023.
//

import SwiftUI

struct MovieView: View {
    @StateObject var viewModel = MovieDBViewModel()
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [colorScheme == .dark ? Color("BlueColor2") : Color("GreenColor2") , Color.black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    if searchText.isEmpty{
                        VStack(alignment: .leading){
                            Text("Trending")
                                .foregroundColor(colorScheme == .dark ? Color.blue : Color.green)
                                .font(.title2.bold())
                                .shadow(color: .black, radius: 5)
                                .padding(.leading)
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(viewModel.trendingMovie, id: \.id){ trending in
                                        TrendingCard(tredingItem: trending)
                                            .padding(.vertical)
                                    }
                                }
                            }
                            Text("Popular")
                                .foregroundColor(colorScheme == .dark ? Color.blue : Color.green)
                                .font(.title2.bold())
                                .shadow(color: .black, radius: 5)
                                .padding(.leading)
                                .padding(.top, 20)
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(viewModel.popularMovie, id: \.id){ popular in
                                       PopularCard(popular: popular)
                                            .padding(.vertical)
                                        
                                    }
                                }
                            }
                            Text("Upcoming")
                                .foregroundColor(colorScheme == .dark ? Color.blue : Color.green)
                                .font(.title2.bold())
                                .shadow(color: .black, radius: 5)
                                .padding(.leading)
                                .padding(.top, 20)
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(viewModel.upComingMovie, id: \.id){ upComing in
                                       UpCommingCard(upComing: upComing)
                                            .padding(.vertical)
                                        
                                    }
                                }
                            }
                        }
                        
                    }else{
                        VStack(alignment: .leading){
                            ForEach(viewModel.searchText, id: \.id){ search in
                                    HStack{
                                        AsyncImage(url: search.backDropUrl){ image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(20)
                                                .frame(width: 140, height: 100)
                                                .padding(.leading, 5)
                                        }placeholder: {
                                            ProgressView()
                                                .frame(width: 140, height: 100)
                                                .padding(.leading, 5)
                                        }
                                        Text(search.title ?? "Unknown")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                            .frame(width: 180, height: 80, alignment: .leading)
                                            .lineLimit(1)
                                            .padding(.leading)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 100)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .searchable(text: $searchText)
                .onChange(of: searchText){ newValue in
                    if newValue.count > 2{
                        viewModel.search(term: newValue)
                    }
                }
                .onAppear{
                    viewModel.loadTrendingMovie()
                    viewModel.loadPopular()
                    viewModel.loadUpComing()
                }
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
