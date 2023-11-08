//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    private let episodeCollectionView = EpisodeCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Episodes"
        
        setupViews()
        setConstraints()
        self.episodeCollectionView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(episodeCollectionView)
    }
    
}

extension EpisodeViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            episodeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
