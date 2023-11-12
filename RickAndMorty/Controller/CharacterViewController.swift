//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 04.11.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    private var characterModel: EpisodeModel
    
    init(characterModel: EpisodeModel) {
        self.characterModel = characterModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
    }
    
    private func setConfig() {
        view.backgroundColor = .white
        
        let barButton = UIBarButtonItem(image: UIImage(named: "RickMorty"), style: .plain, target: self, action: #selector(barButtonTapped))
        barButton.tintColor = .black
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func barButtonTapped() {
       print("RickAndMorty")
    }
}
