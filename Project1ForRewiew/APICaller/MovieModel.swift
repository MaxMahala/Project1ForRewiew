//
//  MovieModel.swift
//  Project1ForRewiew
//
//  Created by Maksym on 18.10.2023.
//

import Foundation


struct MoviesResponse: Codable{
    var page: Int
    var results: [MovieItem]
    let total_pages: Int
    let total_results: Int
    
}
struct MovieItem: Codable{
    var id: Int
    var title: String?
    var poster_path: String?
    var vote_average: Double
    let backdrop_path: String?
    let media_type: String?
    
    var backDropUrl: URL{
        let backDrop = URL(string: "https://image.tmdb.org/t/p/w500")!
        return backDrop.appending(path: backdrop_path ?? "unknown")
    }
}
