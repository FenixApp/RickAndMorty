//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 10.11.2023.
//

import Foundation

class EpisodeViewModel {
    
    private var apiService = ApiService()
    private var episodes = [Results]()
    
    func fetchEpisodesData(completion: @escaping () -> ()) {
        
        apiService.getEpisodesData { [weak self](result) in
            
            switch result {
            case .success(let listOf):
                self?.episodes = listOf.results
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int
    {
        if episodes.count != 0 {
            return episodes.count
        }
        return 0
    }
    
    func cellForItemAt (indexPath: IndexPath) -> Results {
        return episodes[indexPath.item]
    }
}
