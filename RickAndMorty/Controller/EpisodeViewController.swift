//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    private let episodeCollectionView = EpisodeCollectionView()
    private lazy var episodeViewModel = EpisodeViewModel(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        title = "Episodes"
        
        view.addSubview(episodeCollectionView)
        episodeViewModel.getEpisode()
    }
    
    func setEpisode(_ episodeModel: [EpisodeModel]) {
        print(episodeModel)
        episodeCollectionView.setEpisode(episodeModel)
        DispatchQueue.main.async {
            self.episodeCollectionView.reloadData()
        }
    }
    
}

//MARK: - Set Constraints

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