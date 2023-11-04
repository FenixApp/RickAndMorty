//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

final class EpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        let request = Request(endpoint: .episode)
        print(request.url)
    }
    
}
