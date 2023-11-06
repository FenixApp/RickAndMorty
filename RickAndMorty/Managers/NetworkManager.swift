//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 05.11.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    public init() {}
    
    func fetchData(completion: @escaping(GetAllEpisodesResponse) -> Void) {
        guard let url = URL(string: Link.episodesAPI.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let getAllEpisodesResponse = try JSONDecoder().decode(GetAllEpisodesResponse.self, from: data)
                print(getAllEpisodesResponse)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
