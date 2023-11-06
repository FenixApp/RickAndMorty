//
//  GetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 05.11.2023.
//

import Foundation

struct GetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [Details]
}

enum Link: String {
    case episodesAPI = "https://rickandmortyapi.com/api/episode"
}
