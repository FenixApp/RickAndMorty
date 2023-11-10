//
//  EpisodeCollectionView.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 08.11.2023.
//

import UIKit

class EpisodeCollectionView: UICollectionView {

    private let collectionLayout = UICollectionViewFlowLayout()
    private let idEpisodeCell = "idEpisodeCell"
    
    private var episodeViewModel = EpisodeViewModel()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        setDelegates()
        loadEpisodesData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        register(EpisodeCollectionViewCell.self
                 , forCellWithReuseIdentifier: idEpisodeCell)
    }
    
    private func setDelegates() {
        delegate = self
    }
    
    private func loadEpisodesData() {
        episodeViewModel.fetchEpisodesData { [weak self] in
            self?.dataSource = self
            self?.reloadData()
        }
    }
}

//MARK: - UICollectionViewDataSource

extension EpisodeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodeViewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idEpisodeCell, for: indexPath) as? EpisodeCollectionViewCell else { return UICollectionViewCell()
        }
        
        let episodeData = episodeViewModel.cellForItemAt(indexPath: indexPath)
        cell.setCellWithValuesOf(episodeData)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension EpisodeCollectionView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension EpisodeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
}
