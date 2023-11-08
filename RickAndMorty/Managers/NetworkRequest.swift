//
//  NetworkRequest.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 05.11.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(completion: @escaping(Result<Data, Error>) -> Void) {
        
        let url = "https://rickandmortyapi.com/api/episode"
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
