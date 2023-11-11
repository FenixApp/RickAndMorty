//
//  ApiService.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 10.11.2023.
//

import Foundation

class ApiService {
    
    static let shared = ApiService()
    private init() {}
    private var dataTask: URLSessionDataTask?

    func getEpisodeData(completion: @escaping (Result<Data, Error>) -> Void) {

        let episodeURL = "https://rickandmortyapi.com/api/episode"
        guard let url = URL(string: episodeURL) else { return }

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

            guard data != nil else {
                print("Empty Data")
                return
            }

        }
        dataTask?.resume()
    }
    
    func getCharacterData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {

        let characterURL = "https://rickandmortyapi.com/api/character/\(id)"
        guard let url = URL(string: characterURL) else { return }

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

            guard data != nil else {
                print("Empty Data")
                return
            }

        }
        dataTask?.resume()
    }
    
    func getImageData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {

        let imageURL = "https://rickandmortyapi.com/api/character/avatar/\(id).jpeg"
        guard let url = URL(string: imageURL) else { return }

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

            guard data != nil else {
                print("Empty Data")
                return
            }

        }
        dataTask?.resume()
    }
}
