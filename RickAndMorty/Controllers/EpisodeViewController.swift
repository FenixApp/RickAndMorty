//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

final class EpisodeViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    private var getAllEpisodesModel: GetAllEpisodesResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
            
        
    }
    
}
