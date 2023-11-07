//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.backgroundColor = .systemBackground
            collection.translatesAutoresizingMaskIntoConstraints = false
            
            collection.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.id)
            collection.delegate = self
            collection.dataSource = self
            
            return collection
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            setupViews()
            setupConstraints()
        }

        func setupViews() {
            view.addSubview(collectionView)
        }
        
        func setupConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0)
            ])
        }
    }

    extension EpisodeViewController: UICollectionViewDelegate {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    }

    extension EpisodeViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.id, for: indexPath) as! EpisodeCollectionViewCell
            return cell
        }
    }

    extension EpisodeViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width, height: 350)
        }
}
