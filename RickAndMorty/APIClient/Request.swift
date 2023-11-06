//
//  Request.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import Foundation

//final class Request {
//    private struct Constants {
//        static let baseUrl = "https://rickandmortyapi.com/api"
//    }
//    
//    private let endpoint: Endpoint
//    
//    private let pathComponents: [String]
//    
//    private let queryParameters: [URLQueryItem]
//    
//    /// Constructed url for the api request in string format
//    private var urlString: String {
//        var string = Constants.baseUrl
//        string += "/"
//        string += endpoint.rawValue
//        
//        if !pathComponents.isEmpty {
//            pathComponents.forEach({
//                string += "/\($0)"
//            })
//        }
//        
//        if !queryParameters.isEmpty {
//            string += "?"
//            let argumentString = queryParameters.compactMap({
//                guard let value = $0.value else { return nil }
//                return "\($0.name)=\(value)"
//            }).joined(separator: "&")
//            
//            string += argumentString
//        }
//        
//        return string
//    }
//    
//    public var url: URL? {
//        return URL(string: urlString)
//    }
//    
//    public let httpMethod = "GET"
//    
//    public init(endpoint: Endpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
//        self.endpoint = endpoint
//        self.pathComponents = pathComponents
//        self.queryParameters = queryParameters
//    }
//}
//
//extension Request {
//    static let listCharactersRequest = Request(endpoint: .character)
//}
