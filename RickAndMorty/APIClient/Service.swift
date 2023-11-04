//
//  Service.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import Foundation

final class Service {
    static let shared = Service()
    
    private init() {}
    
    public func execute<T: Codable>(_ request: Request, comletion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
