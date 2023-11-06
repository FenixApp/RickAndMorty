//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 03.11.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logoImageView)
        view.backgroundColor = .systemBackground
        
        setupTabs()
        setConstraints()
    }
    
    private func setupTabs() {
        let episodesViewController = EpisodeViewController()
        let favouritesViewController = FavouriteViewController()
        
        let episodesNavigation = UINavigationController(rootViewController: episodesViewController)
        let favouritesNavigation = UINavigationController(rootViewController: favouritesViewController)
        
        episodesNavigation.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 1)
        favouritesNavigation.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 2)
        
        setViewControllers([episodesNavigation, favouritesNavigation], animated: true)
    }
}

extension TabBarViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 128),
            logoImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}
