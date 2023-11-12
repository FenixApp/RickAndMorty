//
//  ApiImageService.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 10.11.2023.
//

import Foundation
class ApiImageService {
    
    private var dataTask: URLSessionDataTask?
    
    func getEpisodesData(completion: @escaping (Result<EpisodeData, Error>) -> Void) {
        
        let episodesURL = "https://rickandmortyapi.com/api/episode"
        
        guard let url = URL(string: episodesURL) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(EpisodeData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
