//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 03.11.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItems()
        setupLayer()
    }
    
    private func setupLayer() {
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.systemGroupedBackground.cgColor
    }
    
    private func setupItems() {
        let episodesViewController = EpisodeViewController()
        let favouritesViewController = FavouriteViewController()
        
        setViewControllers([episodesViewController, favouritesViewController], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "heart")
    }
}
