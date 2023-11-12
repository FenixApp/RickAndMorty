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
    
    private let apiService = ApiService.shared
    private let dataFetchService = DataFetchService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        episodeViewModel.getEpisode()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        episodeCollectionView.episodeDelegate = self
        view.addSubview(episodeCollectionView)
    }
    
    func setEpisode(_ episodeModel: [EpisodeModel]) {
        print(episodeModel)
        episodeCollectionView.setEpisode(episodeModel)
        DispatchQueue.main.async {
            self.episodeCollectionView.reloadData()
        }
    }
    
}

//MARK: - EpisodeProtocol

extension EpisodeViewController: EpisodeProtocol {
    func didSelect(character: EpisodeModel) {
        let characterViewController = CharacterViewController(characterModel: character)
        navigationController?.pushViewController(characterViewController, animated: true)
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
