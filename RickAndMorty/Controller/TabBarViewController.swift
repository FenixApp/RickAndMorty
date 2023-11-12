//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 03.11.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItems()
        setupLayer()
    }
    
    private func setupLayer() {
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.backgroundColor = .systemBackground
    }
    
    private func setupItems() {
        let episodesViewController = UINavigationController(rootViewController: EpisodeViewController())
        let favouritesViewController = UINavigationController(rootViewController: FavouriteViewController())
        
        setViewControllers([episodesViewController, favouritesViewController], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "heart")
    }
}
