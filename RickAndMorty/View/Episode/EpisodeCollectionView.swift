//
//  EpisodeCollectionView.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 08.11.2023.
//

import UIKit

protocol EpisodeProtocol: AnyObject {
    func didSelect(character: EpisodeModel)
}

final class EpisodeCollectionView: UICollectionView {
    
    weak var episodeDelegate: EpisodeProtocol?

    private let collectionLayout = UICollectionViewFlowLayout()
    private var episodeModel = [EpisodeModel]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        setDelegates()
        register(EpisodeCollectionViewCell.self
                 , forCellWithReuseIdentifier: EpisodeCollectionViewCell.idEpisodeCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    func setEpisode(_ episode: [EpisodeModel]) {
        self.episodeModel = episode
    }
}

//MARK: - UICollectionViewDataSource

extension EpisodeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        episodeModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.idEpisodeCell, for: indexPath) as? EpisodeCollectionViewCell else { return UICollectionViewCell()
        }
        
        cell.setValue(model: episodeModel[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension EpisodeCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        episodeDelegate?.didSelect(character: episodeModel[indexPath.row])
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension EpisodeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
}
