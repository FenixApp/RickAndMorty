//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

final class EpisodeViewController: UIViewController {
    
    private let episodeCollectionView = EpisodeCollectionView()
    private lazy var episodeViewModel = EpisodeViewModel(viewController: self)
    
    private let apiService = ApiService.shared
    private let dataFetchService = DataFetchService.shared
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        episodeViewModel.getEpisode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: animated)
         super.viewWillDisappear(animated)
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        episodeCollectionView.episodeDelegate = self
        view.addSubview(episodeCollectionView)
        view.addSubview(logoImageView)
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
        let offsetTop = (navigationController?.navigationBar.frame.size.height ?? 0)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50 - offsetTop),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.4),
            
            episodeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            episodeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            episodeCollectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            episodeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
