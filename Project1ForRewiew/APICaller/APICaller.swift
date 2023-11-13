//
//  APICaller.swift
//  Project1ForRewiew
//
//  Created by Maksym on 18.10.2023.
//

import Foundation

@MainActor
class MovieDBViewModel: ObservableObject{
    
    @Published var trendingMovie: [MovieItem] = []
    @Published var searchText: [MovieItem] = []
    @Published var popularMovie: [MovieItem] = []
    @Published var upComingMovie: [MovieItem] = []
    
    static let API_Key = "99b431cf23090a5b5ef4e33b0c435cbd"
    
    func loadTrendingMovie(){
        Task{
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDBViewModel.API_Key)")!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MoviesResponse.self, from: data)
                trendingMovie = trendingResults.results
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func loadPopular(){
        Task{
            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(MovieDBViewModel.API_Key)")!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MoviesResponse.self, from: data)
                popularMovie = trendingResults.results
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func loadUpComing(){
        Task{
            let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(MovieDBViewModel.API_Key)")!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MoviesResponse.self, from: data)
                upComingMovie = trendingResults.results
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func search(term: String){
        Task{
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDBViewModel.API_Key)&query=\(term)")!
            do{
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MoviesResponse.self, from: data)
                searchText = trendingResults.results
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
