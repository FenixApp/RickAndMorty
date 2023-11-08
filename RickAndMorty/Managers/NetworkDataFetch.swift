//
//  NetworkDataFetch.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 08.11.2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchEpisode(responce: @escaping (EpisodeModel?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData { result in
            switch result {
            case .success(let data):
                do {
                    let episode = try JSONDecoder().decode(EpisodeModel.self, from: data)
                    responce(episode, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                responce(nil, error)
            }
        }
    }
}
