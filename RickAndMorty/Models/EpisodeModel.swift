//
//  EpisodeModel.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 05.11.2023.
//

import Foundation

struct EpisodeModel: Codable {
    let info: Info
    let results: [Results]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Results: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
}
