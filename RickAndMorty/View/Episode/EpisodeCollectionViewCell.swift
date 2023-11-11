//
//  EpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 06.11.2023.
//

import Foundation
import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    static let idEpisodeCell = "EpisodeCollectionViewCell"
    
    private let dataView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGroupedBackground
        imageView.layer.cornerRadius = 10
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageMovie: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.tv")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameEpisodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let underLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "|"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberEpisodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageHeart: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .link
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(dataView)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionView)
        contentView.addSubview(imageMovie)
        contentView.addSubview(nameEpisodeLabel)
        contentView.addSubview(underLabel)
        contentView.addSubview(numberEpisodeLabel)
        contentView.addSubview(imageHeart)
    }
    
    private func setupLayer() {
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        contentView.layer.shadowOpacity = 0.3
    }
    
    func setValue(model: EpisodeModel) {
        imageView.image = model.imagePerson
        nameLabel.text = model.namePerson
        nameEpisodeLabel.text = model.nameEpisode
        numberEpisodeLabel.text = model.codeEpisode
    }
    
}

//MARK: - Set Constraints

extension EpisodeCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            dataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dataView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dataView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            imageView.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: -20),
            
            descriptionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 0),
            descriptionView.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: 0),
            descriptionView.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 0),
            
            imageMovie.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 25),
            imageMovie.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: imageMovie.trailingAnchor, constant: 10),
            nameEpisodeLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            
            underLabel.leadingAnchor.constraint(equalTo: nameEpisodeLabel.trailingAnchor, constant: 5),
            underLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            
            numberEpisodeLabel.leadingAnchor.constraint(equalTo: underLabel.trailingAnchor, constant: 5),
            numberEpisodeLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            
            imageHeart.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -25),
            imageHeart.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor)
        ])
    }
}
