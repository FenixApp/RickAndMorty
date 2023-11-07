//
//  EpisodeCollectionView.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 06.11.2023.
//

import UIKit

class EpisodeCollectionView: UICollectionView {

    private let collectionLayout = UICollectionViewFlowLayout()
    private let idEpisodeCell = "idEpisodeCell"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        setupLayout()
        register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: idEpisodeCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 3
    }
    
    private func configure() {
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }

}

//MARK: - UICollectionViewDataSource

extension EpisodeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idEpisodeCell, for: indexPath) as? EpisodeCollectionViewCell else { return UICollectionViewCell()
        }
        return cell
    }
}

extension EpisodeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8, height: collectionView.frame.height)
    }
}
