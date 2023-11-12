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
        imageView.clipsToBounds = true
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
    
    let speciesLabel: UILabel = {
       let label = UILabel()
        label.text = "Male"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
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
        imageView.image = UIImage(named: "Play")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameEpisodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let underEpisodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "|"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberEpisodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.text = "Test"
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = UIColor(red: 0.09, green: 0.71, blue: 0.80, alpha: 1)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isActive: Bool = false {
        didSet {
            if self.isActive {
                heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                heartButton.tintColor = .red
            } else {
                heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
                heartButton.tintColor = UIColor(red: 0.09, green: 0.71, blue: 0.80, alpha: 1)
            }
        }
    }
    
    private var labelsStackView = UIStackView()
    
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
        contentView.addSubview(speciesLabel)
        contentView.addSubview(descriptionView)
        contentView.addSubview(imageMovie)
        contentView.addSubview(heartButton)
        
        labelsStackView = UIStackView(arrangedSubviews: [nameEpisodeLabel, underEpisodeLabel, numberEpisodeLabel])
        labelsStackView.axis = .horizontal
        labelsStackView.spacing = 5
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelsStackView)
    }
    
    private func setupLayer() {
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        contentView.layer.shadowOpacity = 0.3
    }
    
    func setValue(model: EpisodeModel) {
        imageView.image = model.imagePerson
        nameLabel.text = model.namePerson
        speciesLabel.text = model.speciesPerson
        nameEpisodeLabel.text = model.nameEpisode
        numberEpisodeLabel.text = model.codeEpisode
    }
    
    @objc private func heartButtonTapped() {
        isActive = !isActive
        heartButton.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction) {
            self.heartButton.transform = .identity
        }
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
            
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            speciesLabel.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 20),
            speciesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionView.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            descriptionView.leadingAnchor.constraint(equalTo: dataView.leadingAnchor, constant: 0),
            descriptionView.trailingAnchor.constraint(equalTo: dataView.trailingAnchor, constant: 0),
            descriptionView.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 0),
            
            imageMovie.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 25),
            imageMovie.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            
            labelsStackView.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: imageMovie.trailingAnchor, constant: 5),
            labelsStackView.trailingAnchor.constraint(equalTo: heartButton.leadingAnchor, constant: -5),
            
            heartButton.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -25),
            heartButton.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor)
        ])
    }
}
