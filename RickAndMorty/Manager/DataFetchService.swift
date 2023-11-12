//
//  DataFetchService.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 10.11.2023.
//

import Foundation
class DataFetchService {
    
    static let shared = DataFetchService()
    private let jsonDecoder = JSONDecoder()

    private init() {}
    
    func fetchEpisode(response: @escaping (EpisodeData?, Error?) -> Void) {
        ApiService.shared.getEpisodeData { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                do {
                    let episode = try self.jsonDecoder.decode(EpisodeData.self, from: data)
                    response(episode, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil, error)
            }
        }
    }
    
    func fetchCharacter(id: String, response: @escaping (CharacterData?, Error?) -> Void) {
        ApiService.shared.getCharacterData(id: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                do {
                    let episode = try self.jsonDecoder.decode(CharacterData.self, from: data)
                    response(episode, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil, error)
            }
        }
    }
}
